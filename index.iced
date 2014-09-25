assert = require 'assert'
{pack,unpack} = require 'purepack'

bufferify = (o) ->
  typ = typeof(o)
  switch typ
    when 'string'
      if (o.length % 2 is 0) and o.match /^[A-Fa-f0-9]+$/
        new Buffer o, 'hex'
      else
        o
    when 'object'
      if Array.isArray(o) then (bufferify(e) for e in o)
      else if (o is null) then null
      else
        d2 = {}
        for k,v of o
          d2[k] = bufferify(v)
        d2
    else
      o

unbufferify = (o) ->
  if typeof(o) isnt 'object' then o
  else if Array.isArray(o) then (unbufferify(e) for e in o)
  else if (o is null) then null
  else if Buffer.isBuffer(o) then o.toString('hex')
  else
    d2 = {}
    for k,v of o
      d2[k] = unbufferify(v)
    d2

compress = (o) -> pack bufferify o
uncompress = (o) -> unbufferify unpack o

raw = """{"tab":{"00":"8b371156b9b7cf45f7c71b998cfb011e14112c8dcbf5e0f8cc9c46216577e5cef3f42d715313f4d3c3e06449d9eca96becc639cd211ef67affdd86d538ca02b9","01":"039af728afc30a74033f08e4e61f740624b2f540f30b4283e3a6aeef4d2597821a4ccfb06015212ca45f67acddd0d68ebc17a0ce00be7df48b1ed310a065383a","02":"2a7d1e7e3cafed7146eebf0d60c0d055998b2df25c397ce77f035f3cb9964b2377b3eb7603679f84f5a19e0e9862732b0d66bef79e8094d1b4494efcd592d0af","03":"427548ecf513a370ba427f90ce6906b1a5d11a64d18e252ebcf3fa1885d7ab36711c2209fea02f32bbceb09244389d217be9b6ca2659984a57f0f4635da90cee","04":"6e57ba5f779aa825762d1da47de48790482709f17e4d625298a3526b2356288e1c000798211d6ff40bbb62b688ccd1c39862122d9ae83f35105199dd8cc9d7f8","05":"746393406fe58fc9ac04c37dc6e95cb5bb241218bea1fc716d9a6fe6d91bb69ed2f472d4c5551289cf0b3772e0d43719d283c50df33a8839386be3994f22a3b8","06":"15fa287ea3d2d68be35a56dd00e2c8a162b7761985331664e7aba4f96495b50f7292364e695f35ebebcef66c13b3fdb1d6ad7d7279b51b679c77d2f1a58eb443","07":"6e36205a777bfb194b604acca8823719e302a522db824cb5cbd75df4512c62895445bf4012e9278957f1872c5227491f84aa122336a87af4135eefcab0105c74","08":"142ec24b1d923162795f1d129f8671f7d1b39f3821a0d0fdc4f4e5e601386bc3fae59c9f2b5279aef9e574f5df02f587d232c6f96850aaa74770769b074133c3","09":"bef6e44266a60b873a69a6d642eab345423ef7ab69c8a36d6bbb845967ca5d88b214f5c558a96efbe382e403dce5370351399698956233d6302efa2aefc18660","0a":"715d9f51b2345a1627150e62adcf6dc754c6d386afa951be1ba9de2dbd7e76bbd5ed523363545a67ccf13aa7a66e888966d2e03caf6037235a5276c11a0b80e2","0b":"e1c31d76d9522f37fc48bf54f2d6a491966481511f0e26b76a92c593a69a8e550ad7225a726383539fe1266c0cdbdf0dd887f735446ffdab148f510b43cf729b","0c":"82c446011d0af3ac8cce0a0ef75de76fc5ba52a1610ff2eb065e16bc20c14bdb3eb62853c4cbd0118e5f503dc3c58357530b70b0679e5939e09ca76b1a708dac","0d":"2dbfb480b5aedb1a6f9677ff3674de1113f33d1bada960ff38039f5947955ba1362865995cbff225622732c97432fd1ab3fa1bdee2f7b25cbee076b8f1c8b745","0e":"404a7151fe7963ddbda0a9c5cd74b36393864e56c5d87c1015e7f92af5645c9ab29468c83cfece3367cc1945f29f0d559e4957818389813ec41f3901ce5b061e","0f":"5737e8725e7975516ee44391f54ba4c83cc2f1e1d4f868a5d6e1957049c075db6d20d31ba50c1f766de6a8f52638f53f5f84d887e9944e92cad2b573db86521d","10":"2273a6e5d67d1a1ae73b08baff8670d0ca8229e998e6b4bc8de7f76ec22d595dcca9dc5f06c1d7da7802ecdfa3efb20623d8af9d24631dfc58d946705e771316","11":"9ccc193fba126f1e6d70991ed3178b3efb9382cf05ed228f8b71c41c6ed881486f67693ec674c9d8cbdc8ab78e5acd0b821304a409a2b21fffb1e974510ce858","12":"5c1bad9952bd4c25baa3d962293aad0d44ecae90a246a9b205951407498af3a848ac2f6b1a5532068db7ac4e70623e257a734d3fe81cba19d2596fd86685c783","13":"99f5575ca5bb462bfc470005d5edd4d02532798188cf1849d29883a4b60f04b45aa3cd425e6708d649215cd8c63cb82132f6c4db5f162c5525344c4b38992071","14":"97b79f8525bc5fdd0a3fd1425e37dcb33b2a4dbfa066eda558551ab3ad82fa5d9767f68a4d1cdd701d0caf50a533e53e8d454199fab6ef89b4c485447d091b9e","15":"4ed7cc6496da74cefffbe89a0ec25b8e7e2ca0d50d19a2be126d8fbfb2549272d497b8a94f0794e847bbc3bfcdaa0cb2288f2bf9fa86b42efc7c7474e8151882","16":"3b269f712641b8beeebc3c9c93ddff0e58f2e789f9df19c403be1a17810288e46cd5f205642c55aad8d745b1510bee4fd518d779c78cd99d220a924ee8ae9859","17":"4d940585b9f20d01bf2b37879f6684043ab7975948b1766135fe3be24f1d2a04b05b3ca20fd2da9f1c04c6cc41a0999a76815a60c764fb8f9a1406de81f1c5e0","18":"85a63ac80a66d9ebf75431c566a4c3d84bceb2218bfb7c5de2c50d4b521d23071a3e0612dbca7e309c69dfb1ab1efa22bd235d22bae6b4921026b8ae447a4529","19":"2361e55ab7f04bb63158cb30efe684ef3b111224c7c0097461982fc418236994a88f7c9a391194cbf0258199f916462a7882d26e4b7a80b9982fe18eb5001c2d","1a":"ccb638c7ae1309e560dbc2ef25067da6a035d0d444a50ddb454737535df93abd1e7016aa365865b56c59752478389a167c68598a70a56634172ad8f646db6875","1b":"b18e67e1ee728df3bfdc31a888bd5dc61109005a94a4a127011b70ec972f87b206bf6b2ae03d421f8fe322d1a86f593a06de8a1c37f342f6a05651202930a51b","1c":"35c1e2b5b5da2aed9a37e6e475da2a0512316c409272f7ab9f76d273bd7cba40ebd8459580136f698c1beba03a7111b698ccc6dc6c1005ebe873638a0216453b","1d":"b20f3fbc54062634054afc444b26ce840b88c0e2eba6c46887f889046e6c897573ce4c45038bc7ab5519ec68cad5dc626b4e1e98ac33d4108b3138bb1524a9b1","1e":"6170a30eb0dafcf71af4bb3de7fe71acdb20a9f6c1feea1b13dde26256508a8372bc3e154fb07a6204826278c31455ecdf03294cb79fa057b1a066141cb1ea07","1f":"04c40d5205ddb590758528de91db0ecbbabc7cab66a5e900890b1909fae92ebe82d5c4891555f18fbc09caf2c0d15826de8e892848a651b880290354f9427078","20":"ccea387ece56483d953b0e75cb16eea13a9822d06135e40e3ca4fda933dd173393bd272cc8e740acfade6e46212eab3ec0ba910e56ab50ab37597ef9faf5fe52","21":"c3c21ffc8623ff7480fec9a4ed1982931adf6f580b2e46bce1d9dbece99e8cf4cc85f66bb829dd8c3949dd482c7f905feafbf6e3c29d3262cd447fb4f11754c4","22":"3686558d91625d19e7ccf227f1334fcebed5ff177067190c2d4590ca14184d550c8a664a448eb432fe7fad41bc8cc082a7ea105be049250dd006d43eff58ab68","23":"7addcd722af796c98408a03f9cd5fd587d34b2f537d29095c1e286bec6f79f1f991b4dd35307f2fae3f04098e1c51dbb3eac8e595d70a4221a5b9d5726ae9706","24":"75a151bec5a463b61f9c65b1370c18fed2eb3c86609f3b164012a6e55899b03e0584aa2d1e0d2b8311899095f3f2c097362b6d267e17776ffcc46e8c93f86346","25":"85cc73c30a303d9bd09adfc7cd812f1d47230a6857c014a4430e1816939f00413b7d1db5df21711c164a02bc8d4b6b972d473bf5ae3ebf4cb4677486066641cf","26":"86ce621d16beaff31f59fb315e334ad2e6c7d0b71d45abb3ad12d577141ddabd64308b50dba04cf37cc2b1b26454072d77ef2596833412b97baea6226a9f5765","27":"51e9d1ab2cf4edd1452ed1ef19489adc95f1350348da3e2513a2f0c64cee24d5f60e8f49cc2b7a37fb76837546a9622e9a25faae6714fe9e43d2aeb096a56fac","28":"9a8a5d07a086969a300e9c32d172f66dcc5980b3d04838d3a77682bdce688a7119ebc18718819d3fc659c257a1b48eb5295a14aab3ec49232965991b12d3b183","29":"2d67be09cc45b0d5e27a40f67abc55c11ca3b29a03be902b6b2cb6f210bbd416146289c928ad29c9a6ce4786696b4df0a5fb537239813d1dda14b5aacceb07ce","2a":"161d4017ffffb8549c2aedb49a20d749cacf789aa7d19b70520d06adf2e5a29c5b51ccfabda49e4ec2e588a477ca1089deb77e6813654732e19503f808f0b55f","2b":"7561a782f17b53024131f7028991851b19636a3c65d7f05e58ef3ed177da1e541392b7b129448b57bf4af463acf241dd573e5fcbb33b2e29052ffe077b0df9b2","2c":"df0f346ded542fd8581fe06188a3b734e0b529bfc873336d0c2951c535c3a2160cbebb7e2659c1984f300f84f74f87341d4134dfccc71b82271f17899fb64f21","2d":"ad29be62a87a9e70108b888c7abaa47486aa987a32e7f167a7c5cd0702d9aba0d964e44863a164567ae4a8774bba6f9f49634a7268a27c02dc7670562a6a8c0c","2e":"2be292c74813c99faf1585e88032864b1bd8ccd0776dc44fc58391af63f2104dae6de5f9cf097fda6353f9e3a49e0e9a424a89edfc5c54d1a09167cc835d9bd2","2f":"0d2d073d69c86043dda5c45808c4d042561cbf0f13f75b6ac6d10f21145dd0047b192f43042fd631b0a063627a9a9c95bc79ceefae928f9be013a2f504fb5fb3","30":"f7e69f1070ccf214c6258f8bfb3ce723776a96b36205288a87994e0b31869c568effb8ed8e66d9652bc558c37270a3407c2f2f7c81ae96a9f531f806de019d96","31":"1fa8df1b4cce818765b072271ce12f6a7a055a7e016f19ec968a171345fa9c6756f200a32bb3b7b0e8c79f1a0b64caa518766ee865bcdb340c3d406771bff9e9","32":"3cebf03bb607708d8e83378128918d6768f4895db7179ded82c35ef8e4063279701a360bede11f1e707f87d08a0e9df01d3d88d6b9523e2704ac126eb248887e","33":"1f9fa630d22d96249727c9177a376e0a8bbd06432b4845d1e8607304985a9abc4bd8500a3884a8e9b74eff17e4ae67264c9bb7c0cf65d09b0bd5e0ca052dae2d","34":"1d291e47bd77da8ce6ebe9a30fab9875fc394030f060eed8e4eefeb29f966650916cd3ac5c581489176cb2d46c5a0225f3593ec655578b9826f8c3ffa6c52285","35":"05c7e1857bddccf73f7d67e83d3473b4c67a42e0f23b0e0234b5fec055e43134f0c6170702b2d326b2d083e62f7f050ad7ffaf50b8213b32d5029847aa07c5c9","36":"84c08f21a09f049c6327f8a896a2f9bf0ea7efb2624a65a4697ed004813fc41342b4d0eb0f95afff1013a28bc32ac6aba55a77378c0a1a73e4f51475c9bb04a3","37":"52d7ff2617c43f161a081c73789568dcb031237b7682667cf4c855a2857bae7bd5ac89afa091228b4e2d2a2ca33d459e898059646340c44d04bceedf6de3d0a0","38":"bb21383f00aea02f7851a290e347062a01200483c58da82a90e62ab49e95df969e1f1f7d78e486548eb7560125808d094a8e02a4fa7e7a57aef033fc0a220bae","39":"97947c437f0db1efca9faf9404247fed7211f645900a3fc51c28b524c68eacee0b0c3c2c9102381a814e809a8f3d0b4490ad07c306d0c03d5416ea67f82e5ef6","3a":"b08b59a7a6b3dac67db44b939815af3413c6b964dafbbbecef05d42b2bffd748507a5b3f5568dff3e26b55f355d4e067ad03c52576e88023d68f2cf7186f16c9","3b":"9bf8586fb130bea9be52030e40c2ec5d687e257185b45835c21a599402e87afa0ee89281118d04fc82ee5fd509b4ac1d134c042e5baeca4d05fa2e1cfdc3d1ec","3c":"bc6690770fa62367998fc4f3f615c34b5aae7b39f04557624bda7a048cff38bfd3d6a1983db87931c7f948c050356bb49cf18cf93b2de88e72ea9c6e43f785a9","3d":"df8c570f1bf066482539f6c453c4cfe58f3bfcc60d2f5990afb04937314971ba8c39c55c2c7d39271d87a5466dad3cfed6cd1c51df46c3ccff7a5c1e8c980def","3e":"bc38fc5c8b57ae7ef6e9ce7d532e84d962589ebcf8d115bc31af8f780444b22bc40eb6e283c29fc14ab6f10d694ac59800355f6de06f7cdef2df1204b8c0f357","3f":"da21afb3db05eef08081cdd29bffc846938fbe162319470f8a932bda50b0110a7d50dd298d77082be06517e30b0bc02d972823ae17c23914a036e63a4f74a374","40":"475ab2205c8043d4b8b82f13395e92f8c82dc2898bf654203dc48a36e7b5016c8e3169613664a1daacd740ef92c0a2e93569887c1e3d2369552766a386569bfa","41":"c9e931769df569d2c94d120e7149d266a649dd59719712d489ab9a1cff99cce2c0a8da8307cf12970be53a95495847f50eee701a2a3abcf2b48eb73dbe674f90","42":"b9fb67f113c64fcf5fc78e408fcf4dce3444c396e81f0c91ea295b30a56baa596c88aefb9c8014eb17ea432dee37932c1e6a9d5040d86d2550e34f509ac3912a","43":"372f50c6f64271fcef03d4e89e89fc9b8c5faf6584f2c714195c1217a330033ec9a36ea7d2336cf0cbaa7132f0415002b13047a471c0d10559bbb92f73926554","44":"c920673d0327d355003d1e3c83909cf15186dc35c860ccfb14e3bfd39d607fae27b79c48d2135a74e75c226b944992c647981896fed8a8523793971bda836bd0","45":"748aed4c2ae1f25aaf8cb25cc5b61688c0cbbc2378b845d81daf7a8b9345ae485259ed250130d9f8464ab992954b75da8ad288460738cbc17b1c49060d00f527","46":"cb7a1f8d817e5b9b4a59bfe232d89a334b45881cc412742117a8e0776d1d44fb726b6f4f860c3e1c2606c991314dfbe9ae4ad2e9c8fc6f6cc213bd1e88f5cde9","47":"92fd4fb94a632b58ffe8d6f514c9669bd018381dad567958f3fa2a4979cb9810bb6fdf2e39f523bab89f375cf185b5550e1c4da2b7f90d23b971f54f655273ff","48":"c8f1cd2d5bfcbe25403f84084b1e23984bea3ee1c29c7451c0c668c69eb741edacbcafdc2fb8c45f544279063d01ae5ee2c5bd865ccba7c4fdfe3ad929f7fb9c","49":"ff51e269212be23b14c7b7797a587a0cb0190057190bd0cd767e3381ea75f9dbabe904c042121b33d4df322b70a05f2c64f896f760698744d176934393ba8be8","4a":"d518e78c540af5d4e83466187272e98f16e4f528d5435a8a00b6312e57fb650d54abfb759b0d1af58ea36db8c80be6f7a3ec516133b8b49e887ac699a64c6ac0","4b":"e431d04c847936f07a7434445d3621f75c366e24a079c6e4bbce0c926d8e198764e350cf246c26fa14aa71c4b5157c18b49bcf50300df630e2cf080f3c530af4","4c":"94b37b4fc3d45dac08691f74b99c6882f442f9ab678d4eed4e99a550734084a599c984b803ed40626fb28f07c256bd2235b3ade96c2ef7ac169338c9df697622","4d":"77f7ad2604395405e22251c3bc73ba6cdfe250f79da2a1b530c2018dafc6350ad9f1a46814a5d1c03722ad62cb2f4bc215de2700a30b8b53d34f1c482e359694","4e":"e355d77767118ba433593357cbeb731f89328ccafd56c8cec7fdfc943bbd20bd9cf81de253211f6f997eec9780c1b43dc8ebaa678c6d167c46d99abc50832755","4f":"8faa3eeff4a26846dcf653d21c25d6dc4a3cacfc320bf778a9cde3b683d06be79f85bc4756263e760c8e0196fcebfcc14b8e1c1c2a0cc35cb22c71f725a87bc2","50":"92f6edc2b91ad3b0053a0cb9249cd4450366360f6c82f5ea66a4c9c6f13c40ce367b64d6e62c18b09da10919536524f656d1ce1b545db9dd842f50366a29891b","51":"1edce84e0e7fa5a21b57541ea2fee3506282b77572b6c114757838212914b6bfe42e1b1b503729554326db943c2a1a11a6daf217ad925d0d3576860d6e9d405a","52":"b542d95674d795fe665772f46da02c32c5a577f5ea5fab523612f5fbe3065f055d07650c49db50b185fc5903648fb680d1727941bbafedc59251233ef6a992e2","53":"5506ddca7861f6df96996528e5fbe10a7e392295c7711a6ff7215c588cf4a51cbdca84ab057ac6aacc98bc31e1409fb798fc45b90325c08c6bb8abc4dd3835f4","54":"4fd13768dad8a71c65bce6ba740d25f5a9cc2581a3e1f200f6ccfca80d76e7abf403482a8a00b5a731a9a4514a425a558ceb3b81566e90ccf342abd1c2946958","55":"850c9a6c5e7bf2d2677fc1a7894b6d88f4596d6972c399512a58b40daceb89a479c41cf3fe1c70f498edc10234b5127d1e1139949f708892143a24478cbf2edf","56":"a1dd4dc56ea8167703c18393ce2276b78800bc8ad958872fd997a62de92bce304afd70a0c5281eac6dcf148bd29ece4cd13d08fa9ba452ae052357f56fa17786","57":"410ff18a25d74a45ed0119bc197dde5f29a8ac4d986d6a79e91506a4a7a29843248440cabbe84e4951dd40c573d85fa0b032140def583f784e0f4a30da774c38","58":"20fe6ac19ceba8890f3a114a5a55f6df58f7a63c1d14b36cd846bd132fc53e5de514eeb3832481db22b3a461e86649abf35ed0bae20ea3d1217473694904191b","59":"f4557cfece9b039e8f336830a2aa00e52c4c30e34b2e116802eb6716560857fa20e39922a3e32f6b2ecdee9687f5fe353cece58d3bda022f29ad67f97fd0f48c","5a":"390965f3a435a3b641c79ad8f5140cac4e70ddbdffc3e815e9cdf6154adbbe227695b69f7b308217dbd23e0adfc085816da93e7c379ab36e872d229779edfd55","5b":"7f41e1433d9e58bcff759d20dfe50a2bbbf22e0122a21abc92093fa56b193037b67a18703e52925f1a6682dd7ef636c79133e2aea1dcadab0ad47aad68bdb8c4","5c":"2503a199773ad3a6ffcccdd26a6783e2d53f26901c9b73652f43f1a2921844fbfb04902e30ca2c41eb6c8541c565ae6ff9ddc46d4c7e63e3de15756a28d914d7","5d":"b66537a9c858f081e8a306fc6ad6c5543824b863edb725d03195cfbb023e4440bc96a73d1fda5b5722c1d23b2a869505c32067d89c3abe67be825eefdbeb39ee","5e":"80ca055eca3e71f31e6b6428a77a58f1f3858cb88697aaa2e3b4e43f2553b1b1fa167b0c0888303621d555eb002776308df2e5322fa1c8bcf59244a93a8ae097","5f":"e7a7e4e75752ac6b8b6f3af9b28053c4d55dc7bfdfbcfcc63adcca38ff9cba1759aba39d3b2316c0b6d36073ce2133ff4a6bca31e794add205e1f81ab4646723","60":"9aa6cd84e7b3448bd13b7dcf250b5c3340c0bbdb5a465e95fec402ce95f5f9d1894f3b91f3de80f58657ad00079788eba95f61534ba4ee09c049f7ba5dff8f1c","61":"d99b4d373f4fa7bfa47aac893cac2d9b72e2850af60cc8b9e4446594d60732337bb29655b4ab9687118a826b1d06a5aefbd72716611c9ada92c1167d65d50760","62":"559dabc797139c25972cb0f3ad479cc6bc58886191a9747d9c83234018196f017ba6097279de461486dd546c5828904aca43989e1801479dc74e21bf1fd2b332","63":"fcc957a35631c983cd43777edfbc0bbb210f7bd274825c3c1b366c623740ae406390a7b35f8d500e2710bc6eb74c73df4b104c2c48c931650c6665a66f018be8","64":"65fcea72a807a589a4a8f72df89f118a3923eae4b725477e0ca79437fa8d1e6feda4b72e584a3401d143afc7e46b2ec93064837094b89d98c0d1bf251411b692","65":"eb4cb940f40edd8d4b09c5be7fe59b1ea9c45016c7038a7f1d46855c508d6b6fbc05ee2f0667c8383a88a192a3b22bd2cfe785a53771a4b3832ac56f8b8d3627","66":"76aed82d8a3cc2ca98c25da48cb03adb98861b9d051bb0c23b92dc72638914659e292dad3545805fb38b3484965fcec6f1bb082195918b50d1a9c3f121902fd4","67":"682f169a831e2753b0376015e5aca42ecb8c51878f9b43b3a0046ff873d0afa7c56d52747a0d5bbfbd643165ca1ffad5144032ce645618fdabd3b045b4a74b5a","68":"d5a31ac8ed307405657e4a3fc2470cf1cea8f74e15384bd7846ea0229d4ddb7a5dbb8d85a9c0bb24af503efdbedc97d8c6d571e38934a6aa75f481e5641367fc","69":"2cc5998d6619bfaf9737baf61d41173417cfdf73565745b72044de6d8daf912beddfd47200469199238a19c37c96cd02439e3435c039caaf4e60c72bf3801033","6a":"b0a216cac55afed30ea618286281dc18742c20ddcea9acfa5907a1263cc4fd34a9cacd07d6f9d9608c259d585594c6663f7f3c2a6152636935e38bfe7940c59d","6b":"9f2944b69a4c1b52a4d84b31346a9d12624d8c6ef08764b3fc2189c8c07c22f48373da70501b289ff8921851282543b92d560a4b10a54cabf2f1d99f234ee157","6c":"0099e954c04f6d5517d6545ccb9ece10f496a7f82b57aa79d8604029abcdc0d29a6c8905fe6aa271577e6bee801922edfa0bd442196eb09ddcc3bc31c8b19779","6d":"4c8a939a6f6b7d29b01514a5581368b3c89cddcf44f208b0ecf976d6a50a1d3b9a347f77f4563b7efe36038085083329cc889c8d56802a7ab42e19402dfaf173","6e":"521b0367dbd0a549855b71fe1407137fd4ad26585b2052a14e63b98d5519084225541bb5417dba7c22b9a67a7ddfd2a4ede1c23f62c63adc6e06ef350e5e0a7c","6f":"022eea4265628c39022213741227c3eef7db412f536399f9b0f49a7509efb4cb13565cdc376e2826f5ec34b527baa59ab5e986114faad18f893cf941396164c2","70":"d4e7b51db4b5fe31d228ec4a8306c03678b062ee96841dd5656660fd1ab85645659556be89676b9589be9aca0d2d5a7c8ebe0041980d90a8d3ebe068a518c22a","71":"625db02c2350a579d5b4ff292e2b47d525a759c26c3db2450de41ad97d47b9adb9f8598d5551cf8f8f0ce52bd3fefca93ec34fe16c89e338431a7ab696ed36f5","72":"46a1272da35b178f39632ab3e3216d03d85b2306eff19d43fd84566d4101a773b8e570b1a04aa11fe4c0e1beb59b47c9c6a81d4cbcfdbb1f5d1a954fd33a7690","73":"470326015be09f1a12e26e2cb77478eaafb6ad82340eec74dc9c3952dddba75a9e6e60739f6baafa81913d15ac0e094544fedeafc8bef67a066e13673fb5cdaa","74":"c0459e2c6932df54f88581bc6f152b5545e28bcc95a2336b455b7345cd8614eaa6a1634ca45ba959916ed4ae719d58dba06aa5357d325e964273ad4d0246e904","75":"b4205d00b415c8353b7bf0ec9551f790376df3aaefdd0cdddca0d3e26ef5a5fc5e0e34c3d69f797783b3bb649aec23e376494d77b766769c2b81ba40d6514eea","76":"73852145f62bf4ca0cc1b299d38afe0d27c6970a3284404ac854289c3ab5019abc3824418dc347e12498a4ebd5affc83830ed263f2c094a6e7a35b968eed8d19","77":"12d87c77e7b61fc4f72d793785d062ff10309917a43f641f292df63c8783d0a600869855680b49890c5823a64c52abce0994340894c6f3c3be0c15ef7a079161","78":"50e10697d8a365c06e25467f923fc81b0d702a72351643105641a321ed0cd342857944aeea3d509d5443e0c347c6d32415328ee36e48b6c75562b60c42c9ad77","79":"c28970e10fde048a81ed79cb17143eb1c8ae3404e5dda2e564afc85c7041e443fdd4e8fad3febdb54be22d2b32dad98c944097b355f9823d545d447cbd6a2939","7a":"be65c29d336dcbb4106b1b9ae6b53da4356423e2e6c57a4643ae6ac733a7f99b959f67dad0ec616171d64b4253abffa7022a9a85b381d20a5017a440e8d68576","7b":"57298a18052834706d398c57a579a4b32cfd8d8cdcaa4b84e11e9c6cfe0b72fea2b5d8e29e5ed426c022d849a2a2b8d2c3f8f5b8ed80d72d56b0740c1fe50e9d","7c":"b2d422c44b49333c18029364050473bf4a18d43d8cccf4b628418625150a0448250993216471f9db860f6533159d3e1050c4a0fb12b6293d5c528a7a8d44087f","7d":"3df2818f910c3e27142b0b46644c6438f83f6c440cf1b980cec15eb2e36c37de7f241a92165a6f2ea306172c2ab7c53f45ccb45703f4f82cb437bd9dd25902d2","7e":"c7ee2d4c46a07655ebb1639ed769c5d02f9bdc42c294bb577202984f9461f61e27b46074d2e65d2752b3e07f9eabb0d230f5d2ad5895f77ec424fae0e6682573","7f":"1d0e9b839c13c31b273c6951aaffa73bd0663c1bdceec3c474c7da063d6b9555c5d44d7743b831da06a1d047864ac22dbffba1bd5b27522d7dbf7ecdf9952fd8","80":"1d6e6e63004dae7ab55ffde37df09071df068592dc7871b36d931aa65d409b66de252e3bc0ed962a3a6be426b23a3747c90411f61dabfe67f39dd6e89f91f264","81":"b5763ca93ad7003f85dddbebc82f4afe9635394afa50609a0dc3b3203eb181aa55e65de89ae634b1b3eddb3633b9d398713e429029c39f55676f57cbb134f2ee","82":"75f691f44d468630bc3b90f2ce8bf71b3876a963d618932645c44f9d3428061f6dbde50b9e1d357c1cab83263faac75ae98ae296959c5bba212ed727249f262e","83":"e121ca5261156ccff279821a63e5b07a508b23a299df4c02dbcf1f65264472ff14c0f3bd448c571b0114abb3a31ec2910b68c96e8b4052ec8cffeb5c4a00f93d","84":"551c53dcd68e81acdcf11151ea493cb186370e9d42a7952248f756e6216e743f6f3343edd72b853a714f6794ca3a7a1d2115b957dfdce3250f7b5742be5e5cc6","85":"7db1aa1856ec48876ed6b05867775726cfd9b4fb5d18178e305bee5b44f461db0b3b01829d1baf74be1c64a05fc77efa6517d7ed02a690dbf5f0ad7b64a98894","86":"ce52343ccfe7ed1e1123eeea57593ebf9179124bebe9588654eb6df0c789a6ddf0e3d4aca75dd90fd968363889946b90d7a7ea21436d8a87be9ffc97bd74eaca","87":"05bfd3f4e25ceb5a1ddaedcf6d3c8792316fa38aa8755241bef687d0314538c073b6d1df47e573c07332269664be76d6767505ae44ed4a3e71721619afb13464","88":"75d49ca26c6a147aab70cc604163c05d7fb8093162a1cc75c049076345a8051d80538d710852d99d64cb06fe62dd806b159fc49ea932110e55f79b9a0cde9513","89":"56f014ef9181cfc736c3c84d5dd4d21acbdc368e36600f4fa7a4940a1cf151508b08b20ee4f065354cdf20a969bf51893464c2b87c79e5b939ab632f3a0c6bd9","8a":"5cbafbb47e74a42c1beedce969f4b49796f6abe7e95439073930b271bba27c96e9c8494409007c04584d52919a937defdbf0aa43dca94c2bd996d1e15b6b5fbb","8b":"5fb428092ea1a3d7ad416df288891a97b93241f1af846fc2488ce98a7f582aa9bfb94c922a3aae4a30c9066675a6628c1021969b475155c09c327e7c8e667ef1","8c":"78a2403ec855f263d42b58f71b78f8a782abe6cddf3719d6c18c2e0406cdd8588688c675a82a648ea1ca6cfc43adc46e61a70e085dd337d8addc33c6bf8aab18","8d":"36f59007edd84ef3a92f4832cdc77e265dba6d5466f1c27d21ee99bf24e61e6306c105a42e9229ba0faa9b2830571b8292a5a0d2ae86d50be7cda9cd3e63988a","8e":"0b54ae63d5ad67920b1f9aba1d884beb82b770398ae1377ee3381db90a5b38ab987e0f14962185864bb9aa7de42721c77ab89951ce8c70859966e299207e6ebf","8f":"e364e8b2098efb38fda822458398904b3f2c49be4c7b11493866a48fb0a9bdf8e07504d4049a3c668e12125dedfc04f977e548c9f8e74e347ee99b48646e0ee2","90":"10b5c9cc9d45cc1e8640a855840a6fbfc9f63a12ae443f231ba31af06e4a805509d719ae1badd72e8be9388de3176aceb36f1e91f080901f0721f6a8cba63b62","91":"67bfb514a0d3462c4de0b24efa94f002c96eccf9ea68d9d4f1ed5258fe4fa291a660bba97861babbc211379fa49ab88cb0a3e7a8e3b62f0d04f69ad8003de54f","92":"bc4a0f2ac147c2fcded4db6c3b04b7377e4c04f3bc7df635e784fde1866a4f9e2fb7d63a8c449e887ff94c129f36b1e49e8de5dcc3624d8556541e66bc5983dc","93":"3175eb6d6ffa82b8e9b7ec3c4fe0319e7a1effe990b063565a61e3397291f4be0e52625b8366e68d2ca687097e4a5a1c716807d0d81161fe7d86d7659e42268d","94":"70afe16c160bb8ed8273a319ba3b6ad1682bc538812987d53e1c5dacb83ed019dc9811a2f106b5961ec1113b18b2fdedb88f01959b3574402610886fc76dc865","95":"1bb86dd2b56020e0fd0732b8c3593cb910aa84af895c45c5a59eb4b181c51c0ddbcaad418030613a330c9295693455c5642c86eb7ba7d045a0236a3fb9ad90c2","96":"2ec64ab4b71bcc89ac02cedcd46f787083a7ad9c29c0ee3561f8edcf4ae9a4d0d35dcaffa0bd2f471181b87bbab511d4e13bdeeb683e67f8f612e762984163ac","97":"50bb9b042b5235056e22eade96555ee764289a5e51967afbc25e4bc118051055a225bff468f0eb7733c08580efe9238892828cf4ab3b429913ba728ead7cd7aa","98":"e7675a94f394a02acde707c5cd9ab4a19e24cd64d8640e1d1c2a7838ad30c710be8f6b3f1b082eeab595af44e4d2792c87fcff1b4c140ba91e39eb7de698c37c","99":"6e54d401ee866020eed0f25a38960fe4322a3a0843bf70940f47d341f6a2d10209b2716731be633d41303522a5245bb1bb75f0de35265f123b2815d659655dac","9a":"0dc8cc00cc918c6cd74b985ca1e91c69e6749dee583b268f75b6eec8aefb1a87d60fc56e4172d0825248fb344ddf9ad5d0b65d301b0d9034f8c4494fbf4cb542","9b":"acc3ae524e857e57fa2591c746bad4b2d0d62275a7c50c3d64bc6b761732965c5facf931b59d8891c58388c947f485d8755953d46526e31a42d0cebda99d5438","9c":"a3bc2867f532629d8d9c2233211e7d0654bdfb19e86cf6d87a0a4ae595a7e32a912e2658989af747a38ec50016ce4f82a2cd28da806a89d66d67fcc2f2861cc4","9d":"2c39a3c99971bd26e88012f392f52c2be6f27ccfc6393d934472c66538ab6f4403c35b5312cac0ae1a59e86e194f12a1ed4a4268f48de596fe06b7af5556d3da","9e":"a21053171a9ad976d4fbcac3196eb11d29a8f392d947b5bec505a6ab0386489af992ca4308deeb839861ad34c4b869188c71451dbd8796036d82872c77b502a1","9f":"843173193452668640762df4c5a6100035ff50c7fd93fc4bd1281f7638a750e27e33d93399766269426a63b313c7ae9d67bdc2a7c305f78570115a2f54dc341b","a0":"b34d58677120a4e1f9a51c9e1211ef49c6bd5a4e2a0ebe0f6c64b9569aa028102c063c5f5b4bd4b2b757e7b13a085d6c15671b2da80054d4e9e654822af5f86f","a1":"f39f2189ee2d998a2a277ec6c4786c21e4b4e5ceab2eafcd396e9f870e48e39e3e2675f5e7c75f8f77ef35d2c1f4088af3bae2018cca8276b2f2ac523b735ecc","a2":"3b7e2a034f9fe0da7dc5b893faadfbc254c0a884290c0749809c069cfb280e44ecefede7a5df32d565ffb3e7c42a466bfc481e1a130f2c36fbf770e457912a0c","a3":"a9f7d55b3361fecf72ebe6943d23d5ed2e9abfb60fb07ed7591fee492c8b984cf92e0d47999ae7d8fae71a9238b9e0f099ccaf15e1765373166ea9db6dd6d226","a4":"f08b77aa42696893ec281774d2805595632c82d8639ecac0f063d19f8a2ca583a76ff3834c230379a76c43fe062839ec0c714a59ade79cf3d40d9af8145a1207","a5":"d9e491a9a696b98f5e1782e07c5b3ad900466a4862827f8a5006b41882f8df41dfe88e67be57b257e19d3e130f37c979db2d5fc13b6dc0732ed56216103aa042","a6":"32b702eafacbc9f36b4450c555c3ed695f171e006b535af84a5f527943ae1935099b7ab79d2bd6668f719e2eff650aa63ac795bbc646134700dfab25e98e73fd","a7":"ba837c2f0f8ddb30950c9bb160b443429d41e56445d2fb19cd112298c3a112e35b488251ac1d429577f41433bdce67dfa2596568f12baa1d9b65e6c1fc28e568","a8":"6f628939a75686d55f4c23778613fa290eb980a19778e58365ddf593732925e9ae78118835eb3d188d59abf21a30f4dc20ffd5147cea4169544742655d14fd8c","a9":"6806b1b2e2d0766aac67a3e90a382ac4bcc8e7e0b6e8a0e5fefab0698a93933bf1882e35be3cb0decbf582fb00057efcc4973d2971c6ef7bb4dfb1ad7b65a3f1","aa":"8af86418a296a92b9575ac7a44965d94999e7bead53fa8d4985d61dfadce58a5c2fff033d64682872af4e44b9309c81de9b88fe1c140bfa4e54fde7c35eece60","ab":"f2344ca124d1e6dc45576e13400c320a070e3b0836d4dbe233f6326f647e35fd6e0f23084959d5bab7c5f7ea99b6305f82fcd30c367de32a724e147c6bad7b41","ac":"00b3ad7194a67b9517b809500f44697f70c6143e999fc0c841846e4478d3ba7e464855788837aed0a32b4b8fc4c44310835fb86ea8f963cb8db90db959f06640","ad":"78d7cfa98279d1308cda08719f2d533b4f4bd9a3626102ea51a14b96463d41be393eb65058322c4530abfc3b724929a3309cb0e8f7b00907d8d9d700991b4984","ae":"5788e5879c7396b35292954e3b1ad36b0f5a2634cde0c4592ca0f26b5006949c0b0f3c212a22010f1fb520eb92ae90d0e602b21dec285bec833f82284e9f0173","af":"47d4117306590fcb996f58ed2aa4bb9d7e5d70c9c50932cf1f8cba59ca633c8f2fcabbaab4eac3e053ce2675cb14daec413a475f3e71233d87d66da2ac2cc412","b0":"d547ae8098b2f2c86b5af872d147fee366df40ab0188cd94c4e77303124c4e4fc732fd023a0cb01105dd200d6bb8382cafa188a1d3f09482e502cda542a17d3a","b1":"980c1379eca67f22df47551a039c3b653675c192ccffa81349bd0007bd212329fcbe9d13229cee9a4b81909259c6515e1a22532e8fb365b694928a6162489b22","b2":"cac75992553d3cbd8be4e12f644c004fb350c35f12545c5ccd2465656651c055513d3527a800d0ec262a6be1dee73a0ca0570075d19ec2c6920d6a546df2b605","b3":"fb05d4491f9ca0034d605b01d5c66c4fd5588a9dda415147ba23c1bfd021f09a758290cb3f0507abc9a3335d0eff26f990d8aa4370ac21e8a8d49b0e6953117a","b4":"b2e64d018e7658003622346e14a963f319c68fd552cc60a56e2f7e43a1c2fe0278a2123a33014514ef5449e591b663e531c9840118639a93cddaf4eb65e2a135","b5":"d0c393e5a6e5210dd1c121a58397a7bdc61efff664bc914506708b9e2619221af2032f733d938a93f6203a8df7e068e6e28fd2f98e87a5e6dd7a027ddde06bef","b6":"7336cceb49a0a9c03b0a97731514458f47d30166989bc144938c0e62ef6695ba9a121e5ba04db30f45180e6f015cc767e4b8219f81f4d8a58095b105d2253f93","b7":"bd7b0534235a83c668fa14c91e8d477cefab29756e0cb5c7e12576f0db32f42ded05de682e0bead8cabe77f4ee66bbb34a155c3250d04905e44b6f44c21c8a95","b8":"1735b8f0b65b51fff90a21914050e9184e5ea8389d2c8bea346f02f35f612bfd93e7cbb1f42db0b2e9b9b5b948e3b4bd44789a1a25500369ae634b9d73003b70","b9":"3af9703ff9383b32c0f773b2fcac4ead201583ef40e7491383924bf40cc20da3a7c8f891b7783d70d551bae59cd06e4874502534a11c1df2a80c7575c9d5dcbb","ba":"4712bb139a398d55ca9be96cb665eb566bb6333f4adf5484a5a1f9457e98f3524dc2a5d6da4c38e5901beb86ae09e79f77b29833c38a7ce1c51b3b672ab59753","bb":"af7667ee1cbcf842181848d5f0eb3718ec27ce39eb46837d0a3800e0ed7a47012beb962a5df69f5277fb4a5310ace0c2a97afd860339f173ffe92881cb56846f","bc":"374a4ef4ef3696b4f2198197554b8652b852521f278384fe51c55b17e9b47e20e433001dadc3c224e458c354010eb0a329500e488a5838a2c36bfd31b3e188ed","bd":"fc757d5b4a0807b435ae3635a221ef94ff0968f0d5a2db24daced809588e5a2a424377d1230c6d635837f62d7fcf82db5cded0376d15d85172db0d4301528c3b","be":"ccf242a54deeddeb8a24bc907fd616d2633a6493ac9caa92055265663a8c381876c21a942b59cb261fbbb05814310c5d996b5b2ec3a0d968bd15c14bc477188d","bf":"83ed0db8204e1dcaa9852d47ba3c237e61fc847d700d8ea88a41b43c64bbe8dd3f8cccc38a9510090caf446f6659ec24d3daf4e4c9cc8c19c9ff4bce5b7b2977","c0":"52622e0401f32c39bc539a7cf711f8f4bc3db74bc259322b4244be9b1eb3ffb9be996f643361b6954d7b9ff9f95d8d793b22511053fa4dea1f3d15af1f350a23","c1":"aa7bf1a41f2b755db11b617b4da66cfbc8e8c3e53b896b1e73e60aa7485ef80e1b1bbeaca846cb47fbee7ac6f869b35fe98d8bbd37a4d756a0a0daf35cd12352","c2":"cda7264e625ec209db5e3fef4aa43095b2a8c22062ccdf2729f703a6b921647933a1d1fccf35d442bfcde3d40c58b898a32ba9a3576331d8f415e6ba8b4c8b11","c3":"490b47a6a25c57c0b3b20152a4dc10837ceaa4a560d3893a263aea6f04fa97b81dc69757d59aedcf291ccfda56b7e7f84388999473a35899acd7b3f055d8391a","c4":"f9e464383554dbacb5ef490b8a468b1d384666f531e8182c2a5edf790acb30006bd769dcbeb038bc6fc82abc8e066a3b46765fb626920cab6cda1bd87b946bdd","c5":"677f7c9068fd3f86652110492ddca6642948703dbe41da9fc2fe42f542ad589e8d8293df92f51fd8f37c273031099290bb14e226fe3561996386650b7a45c7f2","c6":"8d81aef5ab9547e6b1991c92e9e69480e212bce92d8f2e40a39beba56aabc182f67497a31412e0212480703f1221e123b0c32dbc0b8c9db244046cafdcea7452","c7":"7393e407aaa159dace9a28fd0e17cf808d850425912e3772015b6f2cf7da21ca2de285648a07c7c9c0b5b5b1555d6ce77bd25019a4ce9306dc08c33edab42ada","c8":"236276160a1d5be72f70729909206739d38dfb0d9639152ee963a44fcd71c243e53146b72c8115cfe82854036d088ef81713e422f0aaf84b1c2659ac1a2fb5f7","c9":"c51ee012e37845cc6f68422ee3c20a3d5fcc96374b4ae02b9a28677796b951533ae9087ddd581b8511b08ef95ff719477fad1cdacc5931aa75a0f3fd2759cedb","ca":"7dbdf2925dd7a30f9ba345f456b4a6dc88369267ae8be683c99bab57bb5c831a81df7e6384dff22c1b4a7b54ced06865302a5b94169e5822e928dc385511590e","cb":"27646ddaf9e742b47fcc48f3593c3458644d1a6c459e965fcb712fd40b73c744fbc7a6eda740cb3a161ffa68d09557f03c94f5dfbe015ddc6058d91a0f07cd48","cc":"04651d776d17618e33e90b523852655eebf67d64909bb2e12fa5721d1f2408726b4212cc219caad23223c02bedf3c1d6783953a45f849296f81005f656ccda51","cd":"786d2ba3d035fb3bf4ad46d6f035a3cca83d9a9124549474fd14705dc35de7b52c7f2865956703b25800a1f72f8425dcdb31058850aec88da2514731b2efef26","ce":"6b6144ca2e14da45ff592cae451e346991cf504c89f230262ad6b5faa772025dc3fcd6d82cacfed09bdd5e9a2cb8ff53897ba8490f5e571a66f2b7662af964e7","cf":"9508c1d0c6c458f1ddb7ad035306497bf81aed2033d7de66df1bb8469630bb66c35e9dfe166011874375d73b4c48d38f049c96a3b0b7d88675e6cb34527b3bcf","d0":"199d07216973ebd85eee358e104ca7247dd093db5e2910bb14994acd3972948ea558fdb8f932c5d68e13aba744b5024d626a8382613ee723c85d60d1d240664c","d1":"921eceee4722a9005cac1a4d2896132de30e96b64e008a0e2b4a7fe6ec03bcab6ecf676c8828de734510aef6f3448c4f5f20373f02cd7b18bbe14fb9319cacf4","d2":"4ee1ae99f8e4aca80aabcde20dd40a44d2d4dfd5c60776bcb4cd26d11f3869593940728d7d3c5f366f6adf399a163a46f55c9e812d03a9d71ab014280a00905c","d3":"2cb69b4b106f32615d3442487d33748fd1800b2659b5f122ae9ff195ac804a859612499450e89008bc0a4ea06f9281181bf371c3dc33ca0d7129882eea8b684a","d4":"5b87d2f37811dc45050e50706fb5f9cb85a4d1d30b35c6d3bdc164cfe532938b2ca6d9acdbe904c9da5147206ed4db3a94ba73c014908e3f0db6137a86bff38b","d5":"6de0c2750bdaab352afe45178b27b2a3ea03514a472c0824ed56e5e7a337540242230814c67b124f49482f1197a425aaf7f16946a5d29c3e5f5aa696e140b279","d6":"a4c15c263b3e1ab5161756ff2bffabf55b545ae73a6c3afdeacd819eeb0b38c23419c71ce63c55cda7b6c34f7714f4a7902e03e432c2cd78586903c3faea4787","d7":"f17679c5b9b56293585b1b5bc987fedcded80e948a85110ef80b9a2bb2b0fd6ae87a51b217a64faacb552716a3d9abd9a39ad458ec82032dc5678c5d030ae0ce","d8":"d8471d33309dd1d00466b33c67e3f4e920b3cab95954cfd2dd5ac940f6cda21b56d84f5013297fcede9885d02c132b6529bbe6cb5f6f51580fa993d7c8529bc9","d9":"1a5525794e7f58d642eb9bd30f88111d7061161fbd4f4158c553f7473ffcf57540054919ffa47bfbd0ee6b736353a8823f5a9d4758b589e5afb1fa9decf3506e","da":"0abfee5f046f05106d7fe8dfd4ae3d76ec110bd6988cebdadb64cc6ae90f25fa714c3d019bf8a8ce5e26de7196ccbe02a79a0cf94b095cde926b8207f34ee289","db":"c7979aa330f85c1f1438851e2483aea087f87b73b466382c30b67e233b35e9a54373eabab02f36e9861df95551512d7576ed4bfde72ec5399bee2a59a35be0d6","dc":"ee1f85429c1e8bbdf34f5328bedbbf8853de4749c37f114d3ad623dee0cdcb7783e84489a3a80137d707c01cb530ff85819ca52f6747ec897978b1941b764870","dd":"04a17e2c01c83af84d113366f5418532861cee9eb1b9e7a72e76bcadf4bd9172f504b6004c0d6191bc070b420cb6943a50ef22b5303200aba2720b01e5a2c339","de":"ce677bab5511c8abfea36049dbf1d2f435b7909a249acae494d6364f920e3ea96a85a6843ad7f21eef8d0edb9e30808c78ffeb82725b476e871e2be079d6f9e9","df":"b113808a9573215cb10ef02e5c763a87d01bf9d3c4d450db124a121643f879c62f268408ca83c12dc34f0c887a692b60b6d3d52df1ac7d088345552d5d8df1d1","e0":"9a3aa8ca922e17527cafb14b714dc4859d6ce3fbb44fefd737142f6de2baf7c6056cdf150c55bdbb6e6df87f22cd110355954f24af15f2c00586573677e6fdc5","e1":"c692b2cea2a55b578858884ba572155a4294b4deeedf2277c1ac0bb05d3d3debbdf614fb9223817cc14ed998264efbf69a292096828ca40f58a977edda4e4ae6","e2":"552122131ec2d49680b8678467abd8d3d1a1b08d1dc8ed556be25d49b7d2e60ec7c2cd800864493d746bf59c51a9b60bf67fc8f94a71000dd1b16a0c82763833","e3":"e6f1ee41d73741ae859ed5a37476df62b094346ac63317b3a3148d011685044035354c310293ed7403b4e5680cefcd6b6fd7ce81dcf8a7e5930c4dc4f748fa80","e4":"2b8f3a72ec4634a185f7f61e7634439095c341c2bb87fb65c506a2580969b88a80cd575765867df5a6c75f605ab019e44dd837b42392898e9d4ea2655f8625a7","e5":"589fe6fc475c77abdb8ca496f8b5496842d580a4d59d4adc103d105dbe92c5e3a934e09d03a44e10ddf135e9eef4c47247a586367b493d9d6ea7a0a5d5397431","e6":"3ab837dc7f50f70744b0419dd2ca977afa0f4de6f990befc9512718baf166cb2e409cd16a6b735851f46121b71806b61ffb39d99868393c8a7c619f76961d8a8","e7":"7b4cf66c5123399af1958dbcd2fcd9b405d08563f2ea511476f2f2c27acd05c310c9e64a7ba4c8232f36867bc2620334528a3141ddf5f2b88ea5b2e322a790bc","e8":"70211c764bad0d54d789551049707be4284e40f0166de7d8f96f29692a4103620f29fe20cc6bd5396bb0feca39c55be4bb0ac1dedfcce4bab7d2d4fb10484486","e9":"548a82c989b1eca356573f2fb40b1f59f621264cd12c1687215b8e4607682c49a91a17ee203de1f6dc6b99f7cb3d45dacf168665357bc7af54de62299e808261","ea":"a8beb5141237fb7b2e8988424064c90a0cfc077c05a27cf746f47f6ad19e74852abcfb634f6850d9d99afc609260762af895f6e802cae758da025596ef3780a9","eb":"a12645d5753cf318939631ffb755531fe6f6ef1fd78e3225b3917fee257422626b098a874597c354fa41f173b30c917f6322fefc2a954f44e9ea437e098ffb3b","ec":"30e6726dd66fe6cfbcf36e68493a0c0feb0e0515d4e6ed515f8ced3d52b227f06c28e30ae0c0d22183e61e9d2d13a1358ac1d86deb2a1789d288e4f5341c8f4b","ed":"66e152945ec78792f2ec969ec9150bb3c3fdbae2564f6f694f2d93fae2cbe18a80e7401993c35429ac1cf794ea5ee9b00a4267290869ee8e19d7acb0aff7ac26","ee":"529d7ff27473cb681b24160dd7dbe9036e732f78eb7183212e7f240236f02a665000ed2b66079d23e85f1bb4b4683cbce306059557be3363733a0e4f50ba1ae1","ef":"3ab2c00ef17f4299f56255b11f43d2ad757c9f0fe019e521de897cc8b25899273a75e72dc881ec78f6e479a0b2598c78c0fbc2a54c158e6c2700a2badcbdd1ae","f0":"d8d948298ec2fc31a0f85a593fceb8a07e0c9e2aee9b0317753f2b7ac3e5e5333b25cc707cab4941cd46fa5daff3676d91bb85c0a3b25b540bf3404e86ea7df9","f1":"3ebd02cfee810a554f30128403b59730134cbb1fe0085f64d625a1b544c96a2e3c54ce57719e2a6ea9a51e185bf59e670e65fe15dc3cc8010b5c65184b9f4f7c","f2":"5309664aaad38d34c76578c964baa70eadcebaddaffd1dd2cf66dde70c0749322c9f0008a4e8ae127931b4ee0785e4f844012e226e148b23432189c0fe394505","f3":"1dedc2266f13ce2db69470c07e054147dc62026f6291bb2dc0787f1e8d555a9dd1f3ca5d9e9c978527c0845edf4b659252991b584abdb8bb2e775c0fd8ff540d","f4":"e33dbd32a3733c5565e7a93496f02189aa6590d4ecdba895329839f9550051e57b0ccda3c2e47b3b8ecf1e6263a6a14c1b73ebd9cca6e9661242db21d8e0104b","f5":"eeb8e0e63b820b66f8328a5285b5a40e73ef51b961a7735a72e9612b60b4b1bb18c3cf9eff75fcffcae178fc72f69d4d76155a7d1d45a13003bd221de79fe1d6","f6":"b84ab5ed772a81e77599b053b5dbcb21723ca031c19d531f74e50f0e12de73fc71f769e09de581cbf317b45ba4919ccf1af92a51626a5d0471586980b0778f55","f7":"28aead180a08315dabcf14df8a1e4ea26630a4f7c075dd50507acca331193a1acde89cc98248e21bda57ee20e231baac423494d4725e58452a4269862cfee13e","f8":"2b3fa8b0f398ce27946d9d7111f075cd01cbee936cb30e85ec57361cf6bb8b23590a4be7a6de5043ad6a8f9db1e0413b4f008d2634df7a024f81787a1c9a9f9f","f9":"5c6ccf4b9b7229a02836d9c9c875170a1d4aba620e275d21e427419f9aae20f1e01eeaa68ffd10bc2aee4af7bbe113b02f2077971e30cbd4afad4bbb1b21bae2","fa":"7e6f3ee0bf2238bb5fbdecb6017b0370e6b6af2bc3822b957a2aabc6f7300f2614956813ee3698d274e718206a01b695a1bcc55d3e7732a1ddb8a1f4a8a89612","fb":"40ed641f41e7e1f7aa35e2c8563bd850bcc5626953e73b9272627c09d9b6e6c11735b31eb8f8f9b566e2c60ce2f97f465a9b71f2aaf7898530f2ef5c87384804","fc":"8e22d58a4ca3a62f63072e41445012c17c1f57aa28aabf4706b59769408ac3dc3a6709ea226c6bdff5da840ede686a63327116abd2699d4e04a61abe380d050e","fd":"35a8e03a52d496644956a1af64d04831d8f1616fd12cd996d5a02f04c07f1118fb4bbfbcf98465e1197d93fd6ee0b89d98d198f41f56489db17b443e3d00ac7a","fe":"744e63c1b13cbe04c1032342b2cdb220e359a1a1e3897f75c08ebc8961f1655994ed6524935920a7b814a2636af5113709edb32e22e50710ff44418d066e2719","ff":"339f567cd12074271fae123a48b370154cfd2f6c4f2fccc1c06ad9b5803494908657b60c43360946fc91bbd44d0983a44b1d3d9325069268cd8a040ed26dc88a"},"type":1}"""
j = JSON.parse raw
console.log raw.length
console.log compress(j).length
console.log compress(j).toString 'binary'
assert.deepEqual uncompress(compress(j)), j
