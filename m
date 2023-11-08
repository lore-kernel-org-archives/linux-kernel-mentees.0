Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D0D2EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B73B24086E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B73B24086E
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.551
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LIPY1BhCiVO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 07:44:08 +0000 (UTC)
X-Greylist: delayed 470 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 08 Nov 2023 07:44:08 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0892C40734
Received: from 18.mo550.mail-out.ovh.net (18.mo550.mail-out.ovh.net [46.105.35.72])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0892C40734
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:44:07 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.138.245])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id D816129C11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 07:36:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k8mr2 (unknown [10.110.103.34])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1CE1B1FE9A;
	Wed,  8 Nov 2023 07:36:15 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
	by ghost-submission-6684bf9d7b-k8mr2 with ESMTPSA
	id t3ULBm86S2VjUxQAdDy9bg
	(envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 07:36:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 09:36:14 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org, airlied@gmail.com, daniel@ffwll.ch,
 qingqing.zhuo@amd.com, Jun.Lei@amd.com, alex.hung@amd.com,
 Zhongwei.Zhang@amd.com, sunran001@208suo.com, Yao.Wang1@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/amd/display: remove duplicated argument
In-Reply-To: <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
References: <20231029093926.137766-1-jose.pekkarinen@foxhound.fi>
 <d56cd927-49fc-cb4e-8abd-abc539e4d276@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e095fae915d44ccc186d5e5ee74ec119@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.101.156
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4210584177794590374
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddurdduheeipdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

On 2023-10-30 15:54, Aurabindo Pillai wrote:
> On 10/29/2023 5:39 AM, José Pekkarinen wrote:
>> Spotted by coccicheck, there is a redundant check for
>> v->SourcePixelFormat[k] != dm_444_16. This patch will
>> remove it. The corresponding output follows.
>> 
>> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c:5130:86-122: 
>> duplicated argument to && or ||
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 
>> +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> index ad741a723c0e..3686f1e7de3a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
>> @@ -5128,7 +5128,7 @@ void 
>> dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>>   			ViewportExceedsSurface = true;
>>     		if (v->SourcePixelFormat[k] != dm_444_64 && 
>> v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != 
>> dm_444_16
>> -				&& v->SourcePixelFormat[k] != dm_444_16 && 
>> v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] != 
>> dm_rgbe) {
>> +				&& v->SourcePixelFormat[k] != dm_444_8 && v->SourcePixelFormat[k] 
>> != dm_rgbe) {
>>   			if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k] || 
>> v->ViewportHeightChroma[k] > v->SurfaceHeightC[k]) {
>>   				ViewportExceedsSurface = true;
>>   			}
> 
> Thanks for catching.
> 
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

     Sorry to bring this up, I just wanted to check whether this
has been applied in the following pulls or not.

     Thanks!

     José.
