Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21A1F4CA4
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 14 Sep 2025 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757835536; cv=none; b=qRp7TYNrLtuMD6+W+A871UvDbkZYjRoL+DDtZadWPaxSVNuYy5JC5bwe08p5O1tzR0xnvs2HYFjy7GKOJEtmCNQRfrsMqnW8iKhdT1an3ljKd6OkIKi+Uzp9BO1TO+ltw77NnRZcvDQmftBEmk5Ejdi+sQQt47TVXEIh7G/HFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757835536; c=relaxed/simple;
	bh=mTCHB+OjoMbnKJ0H8Lp3yiEg4P0RsOycl8VETva/0Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q33/P1g/pAHgTbqYGdc6MgLD163p7ZnVo9us5I1X/TV0TxjOkxB+grr5FeG5Afz1oCEYm5aCvPNC8WG9lXg1qfuCL7iDwE/GP+tw2jcoJBlz9shfFvH0S6mDwL4+SlZmH0NGIFNhIyU4hU1/In6FlvsH47N2Pe2rrSyJk2fIcuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=Up1nD9Ai; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nEJc20XW; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="Up1nD9Ai";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nEJc20XW"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6A4861D00061;
	Sun, 14 Sep 2025 03:38:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 14 Sep 2025 03:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1757835533; x=1757921933; bh=pE+XOXk7N+a4D+lu9qx7F
	n9DI70/ulxFLNqin2buoME=; b=Up1nD9AiDPfPKDBqzFGM7gBWk0aO+3FduGdTZ
	c2bu/mYjRMfdEo1xpNIyHyWWoMmb4faQXlezDXAB3PnkjRY5uq6bwBI0fH7bCvAv
	/oHRC8sx+Kin7tRU7z/aFEMU2qi4P1+20ZvP2f1Xf9bijWe1df2fvyoYSBMitlT3
	xZvPKjjqH1iSG4/5zqnsom/uX2T2ipz4e3sxJJlGIKgUhyHpS9RvfigmMb5mD+rA
	z36y1jtwxbbKzVPq9wLuy7z56rUEUDQkja24PiHnlWVpYTeFK2y3FRw6L6qnCmXL
	ufbLJWqgxWqsnFOnJRsFeZHcx/eliHbRwEktMXlrfl6AOrbGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757835533; x=1757921933; bh=pE+XOXk7N+a4D+lu9qx7Fn9DI70/ulxFLNq
	in2buoME=; b=nEJc20XW1W/0Sr3RSzPKo+h+9V4LLykcHO3q8SNl3XqHGeGA0du
	GWGzphVY+jhaTUezL61+1yriqY0YU4UC8V2JuDVwS19ApB3Taup+qnDvX44nvevH
	QjQUcuBbsFRppLgrvBlpCK/yGjYjD3FeMZ+bxai0HRnD3F3csxmhPFK/JCrEtD8s
	Xae4KbAyJj9FXjdfaaEqm0QY+qGF2RIBLwBluiCI16GywJr2BUl9j9B9n6vWs186
	+AijweJTGTDyeM0e8Rkywn/rhidiztynHQ/n1NRM1mRaJW8nmDf7X8zJ6M5MeV19
	HkZfDsZSewqrcQDRimOm2OCHuy3gdz1DFPg==
X-ME-Sender: <xms:DHHGaANkm1nkLzx19Nh4th4t1Co9ytJjQ7U-Go1hcBK9nU_Pkx6Lvw>
    <xme:DHHGaLWAGVia_YsHSauXfNz2IpNN4vN9Gs8OlSR8S2Fx5POY1BKrSMrVSt-T7JU2W
    ejxoASBKsK9v-C8bH8>
X-ME-Received: <xmr:DHHGaFKoCDzKZS6C3OgxTc5_qqAReMzOo3oE7u74FyPDTPmaS_TjAZN6eFw04uWrLdzQuc5L96_onrDisQtf7oudO8O16Sw3RChQZOc6YyIWwM_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefgedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomheplfgrmhgvshcuhfhlohifvghrshcuoegsohhlugdriihonhgvvdefjeef
    sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfevgfekiedutdduhf
    eggfeivdeuhfehtdffjedttdefkeeifeeijeevtefhgeehnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsgholhgurdiiohhnvgdvfeejfeesfh
    grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepjhgrvhhivghrmhesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    epmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtii
    himhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhm
    rghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpth
    htohepshhkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrtghomhdprhgtphhtthho
    pegsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdprhgtphhtthhope
    gurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:DHHGaGrtC-U0Y3pG4tNAyf_u7ZhB-cJ3vvn5r3FACq9wd_oRL4R1OA>
    <xmx:DHHGaMwjGDLyXs_9tNnfkMtICJoklACr1ARrYIJ8RBuwR-W5YaBM9w>
    <xmx:DHHGaKuTGbb1E-tA3kkkHcJqUanoIiBXetpJaQbh-U7YvNgTxPt9Ng>
    <xmx:DHHGaF0AnkFkH1qvU1YgA0MzrUHlI3efvaP0sO8bpYI-QwHpHHO62A>
    <xmx:DXHGaFUr8QUpoAW9rGGs4er_DV6tdbrT4buZGMus2YfltxKKNyETshq4>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 03:38:50 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
Date: Sun, 14 Sep 2025 00:38:22 -0700
Message-ID: <20250914073841.69582-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.
kmalloc_array avoids this issue.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
Note: this has only been compile tested.

 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..8368f0ffbe1e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(columns, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.51.0

