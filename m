Received: from 17.mo550.mail-out.ovh.net (17.mo550.mail-out.ovh.net [87.98.179.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DC4123E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.166])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id C39D62346D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 11:34:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b2n22 (unknown [10.110.103.249])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C796C1FD91;
	Tue, 14 Nov 2023 11:34:03 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.106])
	by ghost-submission-6684bf9d7b-b2n22 with ESMTPSA
	id zqp4KytbU2UpiAAAZEbziQ
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 14 Nov 2023 11:34:03 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R006f8a2c5f3-9a69-4238-9eb7-c409d0b8b06f,
                    39B655737E19CE8DAD14488E69459E8CEBC9C448) smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp:83.100.46.156
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	skhan@linuxfoundation.org
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
	airlied@gmail.com,
	daniel@ffwll.ch,
	Qingqing.Zhuo@amd.com,
	charlene.liu@amd.com,
	stylon.wang@amd.com,
	yang.lee@linux.alibaba.com,
	daniel.miess@amd.com,
	colin.i.king@gmail.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amd/display: fix ptr comparison to 0
Date: Tue, 14 Nov 2023 13:33:56 +0200
Message-Id: <20231114113356.127779-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6570188909338076865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpkeefrddutddtrdegiedrudehiedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

This patch will address the following coccinelle warning where a pointer
is compared to 0 instead of NULL.

drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c:5423:19-20: WARNING comparing pointer to 0

Fixes: 7966f319c66d9 ("drm/amd/display: Introduce DML2")
Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 510be909cd75..7dceaa486841 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -5420,7 +5420,7 @@ static void CalculateOutputLink(
 					*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
 												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
 
-					if (OutBpp == 0 && PHYCLKD32PerState < 20000 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
+					if (OutBpp == NULL && PHYCLKD32PerState < 20000 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
 						*RequiresDSC = true;
 						LinkDSCEnable = true;
 						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
-- 
2.39.2

