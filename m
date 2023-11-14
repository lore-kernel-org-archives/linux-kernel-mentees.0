Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net [188.165.53.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81841765
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.20.216])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 5320E25C5F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 15:28:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kk79p (unknown [10.110.103.114])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0FB981FE70;
	Tue, 14 Nov 2023 15:28:00 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.102])
	by ghost-submission-6684bf9d7b-kk79p with ESMTPSA
	id QNnGNgCSU2UGzg4Aqzq3ag
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 14 Nov 2023 15:28:00 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R00447b4aba0-d8b9-4512-b764-96c8bb41a9fd,
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
	Wayne.Lin@amd.com,
	qingqing.zhuo@amd.com,
	lyude@redhat.com,
	srinivasan.shanmugam@amd.com,
	aurabindo.pillai@amd.com,
	sungjoon.kim@amd.com,
	wenjing.liu@amd.com,
	hamza.mahfooz@amd.com,
	mikita.lipski@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] drm/amd/display: fix NULL dereference
Date: Tue, 14 Nov 2023 17:27:51 +0200
Message-Id: <20231114152751.30167-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10521253157812807361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefvddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpkeefrddutddtrdegiedrudehiedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht

The following patch will fix a minor issue where a debug message is
referencing an struct that has just being checked whether is null or
not. This has been noticed by using coccinelle, in the following output:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: ERROR: aconnector is NULL but dereferenced.

Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM logging macros")
Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
[v1 -> v2]: Remove the debugging message, requested by Hamza

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ed784cf27d39..c7a29bb737e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -536,11 +536,8 @@ bool dm_helpers_dp_read_dpcd(
 
 	struct amdgpu_dm_connector *aconnector = link->priv;
 
-	if (!aconnector) {
-		drm_dbg_dp(aconnector->base.dev,
-			   "Failed to find connector for link!\n");
+	if (!aconnector)
 		return false;
-	}
 
 	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
 				size) == size;
-- 
2.39.2

