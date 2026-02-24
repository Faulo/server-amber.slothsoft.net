<?php
declare(strict_types = 1);
namespace Slothsoft\Server\Amber\Tests;

use PHPUnit\Framework\TestCase;
use Slothsoft\Core\DOMHelper;
use Slothsoft\FarahTesting\Constraints\DOMNodeEqualTo;
use Slothsoft\Farah\FarahUrl\FarahUrl;
use Slothsoft\Farah\FarahUrl\FarahUrlArguments;
use DOMDocumentFragment;

final class AmberSourceTest extends TestCase {
    
    private const AMBERDATA = 'farah://slothsoft@amber/api/editor-data';
    
    private const SAVEGAME = 'farah://slothsoft@amber/api/savegame';
    
    private const REPOSITORY = 'farah://slothsoft@amber.slothsoft.net/source';
    
    private const GAME = 'ambermoon';
    
    private static function getFileNodes(FarahUrl $url): DOMDocumentFragment {
        $document = DOMHelper::loadDocument((string) $url);
        $xpath = DOMHelper::loadXPath($document);
        $nodes = [
            ...$xpath->evaluate('/*/*/*')
        ];
        
        $result = $document->createDocumentFragment();
        foreach ($nodes as $node) {
            $result->appendChild($node);
        }
        return $result;
    }
    
    /**
     *
     * @dataProvider filesToCompare
     */
    public function test_CPU_equals_BLIT(string $infosetId, string $version): void {
        $args = FarahUrlArguments::createFromValueList([
            'repository' => self::REPOSITORY,
            'game' => self::GAME,
            'version' => $version,
            'infosetId' => $infosetId
        ]);
        $cpuArgs = $args->withArgument('archivePath', 'Amberfiles/AM2_CPU');
        $blitArgs = $args->withArgument('archivePath', 'Amberfiles/AM2_BLIT');
        
        $url = FarahUrl::createFromReference(self::AMBERDATA);
        
        $cpuUrl = $url->withAdditionalQueryArguments($cpuArgs);
        $blitUrl = $url->withAdditionalQueryArguments($blitArgs);
        
        $cpuNode = self::getFileNodes($cpuUrl);
        $blitNode = self::getFileNodes($blitUrl);
        
        $this->assertThat($cpuNode, new DOMNodeEqualTo($blitNode));
    }
    
    public function filesToCompare(): iterable {
        $infosets = [
            'items' => 'lib.items'
        ];
        
        $versions = [
            '1.05' => 'Thalion-v1.05-DE',
            '1.06' => 'Slothsoft-v1.06-DE',
            '1.07' => 'Slothsoft-v1.07-DE',
            '1.12' => 'Pyrdacor-v1.12-DE'
        ];
        
        foreach ($infosets as $infosetKey => $infosetId) {
            foreach ($versions as $versionKey => $version) {
                yield "{$infosetKey} v{$versionKey}" => [
                    $infosetId,
                    $version
                ];
            }
        }
    }
}