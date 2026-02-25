<?php
declare(strict_types = 1);
namespace Slothsoft\Server\Amber\Tests;

use PHPUnit\Framework\TestCase;
use Slothsoft\Core\DOMHelper;
use Slothsoft\FarahTesting\Constraints\DOMNodeEqualTo;
use Slothsoft\Farah\FarahUrl\FarahUrl;
use Slothsoft\Farah\FarahUrl\FarahUrlArguments;

final class AmberSourceTest extends TestCase {
    
    private const AMBERDATA = 'farah://slothsoft@amber/api/editor-data';
    
    private const REPOSITORY = 'farah://slothsoft@amber.slothsoft.net/source';
    
    private const GAME = 'ambermoon';
    
    private static function getFileNodes(FarahUrl $url): array {
        $document = DOMHelper::loadDocument((string) $url);
        
        $xpath = DOMHelper::loadXPath($document);
        return [
            ...$xpath->evaluate('/*/*/*')
        ];
    }
    
    /**
     *
     * @dataProvider filesToCompare
     */
    public function test_CPU_equals_BLIT(string $infosetId, string $version, int $index): void {
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
        
        $cpuNodes = self::getFileNodes($cpuUrl);
        $blitNodes = self::getFileNodes($blitUrl);
        
        $this->assertEquals(DOMNodeEqualTo::stringify($cpuNodes[$index]), DOMNodeEqualTo::stringify($blitNodes[$index]));
    }
    
    public function filesToCompare(): iterable {
        $infosets = [
            'AM2' => 'lib.items'
        ];
        
        $versions = [
            '1.05' => 'Thalion-v1.05-DE',
            '1.06' => 'Slothsoft-v1.06-DE'
        ];
        
        $files = [
            'CODE-1' => 0,
            'DATA-2' => 1
        ];
        
        foreach ($infosets as $infosetKey => $infosetId) {
            foreach ($versions as $versionKey => $version) {
                foreach ($files as $fileKey => $file) {
                    yield "{$infosetKey} v{$versionKey} $fileKey" => [
                        $infosetId,
                        $version,
                        $file
                    ];
                }
            }
        }
    }
}