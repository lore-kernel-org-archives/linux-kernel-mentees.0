Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net [46.105.63.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DA612D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.16.91])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 29AEF28858
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Nov 2023 06:36:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xkfk5 (unknown [10.110.208.213])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7942A1FDCE;
	Tue, 14 Nov 2023 06:36:55 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.99])
	by ghost-submission-6684bf9d7b-xkfk5 with ESMTPSA
	id ONtBGYcVU2XrtQYAFz0/+Q
	(envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 14 Nov 2023 06:36:55 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G00388b5308c-d874-4d8f-9cc7-23e6befe93bc,
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
	aurabindo.pillai@amd.com,
	sungjoon.kim@amd.com,
	srinivasan.shanmugam@amd.com,
	hamza.mahfooz@amd.com,
	mikita.lipski@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amd/display: fix NULL dereference
Date: Tue, 14 Nov 2023 08:36:46 +0200
Message-Id: <20231114063647.71929-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1552053025768449729
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefuddgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpkeefrddutddtrdegiedrudehiedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

The following patch will fix a minor issue where a debug message is
referencing an struct that has just being checked whether is null or
not. This has been noticed by using coccinelle, in the following output:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: ERROR: aconnector is NULL but dereferenced.

Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM logging macros")
Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ed784cf27d39..7048dab5e356 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -537,8 +537,7 @@ bool dm_helpers_dp_read_dpcd(
 	struct amdgpu_dm_connector *aconnector = link->priv;
 
 	if (!aconnector) {
-		drm_dbg_dp(aconnector->base.dev,
-			   "Failed to find connector for link!\n");
+		DRM_ERROR("Failed to find connector for link!");
 		return false;
 	}
 
-- 
2.39.2

