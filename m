Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net [46.105.58.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D13D266
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Nov 2023 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.156.34])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 3DC9B28DFD
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Nov 2023 06:55:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lv8ff (unknown [10.110.208.62])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 15B4C1FE12;
	Wed,  8 Nov 2023 06:55:17 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.109])
	by ghost-submission-6684bf9d7b-lv8ff with ESMTPSA
	id uGgwOtUwS2X3fAAAN287Lg
	(envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 06:55:17 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S003812ecbba-255d-4a16-800e-086f660595b3,
                    CA30051851D9204B2894E18F048F6C805596AA31) smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp:87.94.109.40
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	skhan@linuxfoundation.org
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
	airlied@gmail.com,
	daniel@ffwll.ch,
	felix.kuehling@amd.com,
	jonathan.kim@amd.com,
	Jack.Xiao@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amdgpu: remove unused MES_LOG_BUFFER struct
Date: Wed,  8 Nov 2023 08:55:12 +0200
Message-Id: <20231108065512.14087-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3519281634429019841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnheptddutefhgefhgeffhfdtueehudekudduueeiieetgeektddugedvkeetffetvdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeejrdelgedruddtledrgedtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

The mention struct seems not to be used along the driver, and is also
triggering a warning to migrate to flexible array. This patch will
remove the full structure and get rid of the warning.

drivers/gpu/drm/amd/include/mes_v11_api_def.h:192:27-34: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/include/mes_v11_api_def.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
index b1db2b190187..e032ee262fa9 100644
--- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -187,11 +187,6 @@ struct MES_LOG_ENTRY_DATA {
 	};
 };
 
-struct MES_LOG_BUFFER {
-	struct MES_LOG_ENTRY_HEADER	header;
-	struct MES_LOG_ENTRY_DATA	entries[1];
-};
-
 enum MES_SWIP_TO_HWIP_DEF {
 	MES_MAX_HWIP_SEGMENT = 8,
 };
-- 
2.39.2

