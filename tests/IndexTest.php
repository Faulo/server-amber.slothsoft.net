<?php
declare(strict_types = 1);
namespace Slothsoft\Server\Amber\Tests;

use Slothsoft\Farah\Http\MessageFactory;
use Slothsoft\FarahTesting\Module\AbstractTestCase;
use Slothsoft\Farah\RequestStrategy\LookupAssetStrategy;
use Slothsoft\Farah\RequestStrategy\LookupPageStrategy;
use DOMDocument;
use Slothsoft\Core\DOMHelper;
use PHPUnit\Framework\Constraint\LogicalNot;
use PHPUnit\Framework\Constraint\StringContains;

class IndexTest extends AbstractTestCase {
    
    public function testIndex() {
        $_SERVER['REQUEST_URI'] = '/';
        
        $requestStrategy = new LookupPageStrategy();
        
        $request = MessageFactory::createServerRequest($_SERVER, $_REQUEST, $_FILES);
        
        $response = $requestStrategy->process($request);
        
        $data = stream_get_contents($response->getBody()->detach());
        
        $doc = new DOMDocument();
        $this->assertTrue($doc->loadXML($data));
    }
    
    public function testSitemap() {
        $_SERVER['REQUEST_URI'] = 'farah://slothsoft@farah/current-sitemap';
        
        $requestStrategy = new LookupAssetStrategy();
        
        $request = MessageFactory::createServerRequest($_SERVER, $_REQUEST, $_FILES);
        
        $response = $requestStrategy->process($request);
        
        $data = stream_get_contents($response->getBody()->detach());
        
        $doc = new DOMDocument();
        $this->assertTrue($doc->loadXML($data));
        
        foreach ($doc->getElementsByTagNameNS(DOMHelper::NS_FARAH_SITES, 'page') as $pageNode) {
            if ($pageNode->hasAttribute('redirect')) {
                $this->assertThat($pageNode->getAttribute('redirect'), new LogicalNot(new StringContains('//')));
            }
        }
    }
}

