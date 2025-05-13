Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E59145A03
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179990; cv=none; b=FXuH1J35oRWmvtsJRaiVpnHdlMEb5LKCM7+CPooOlWmSVeoWVEIGisUfCMIKtbXdbtkiFJpEfBdm1puAuJ+Pek6UMcjMn57nG8/6dAPtACoXL0UeaQAIw+FpcqsQefB8JAG3tWjEWiX4dfy9vadRVPbl+bYkJlf7U+oRwae5npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179990; c=relaxed/simple;
	bh=JHhqk38Z8zYxuJgof4ijnK3c+I9uYjeSE/sYJ320keg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXkxJsg9TK/lDmLjb1LmJdp26bUe6LNIWJMQhWTVlaUh2MCRbzKWgGV1PeXNAf6zB2P6CYL1hs0nDEEbjWJGfle6Uh0Q+tdCpiDOd7rdBUyt+8m6jR42bRj1zQ0yEvdPDsxOI/FmrsqgO38lxrQfwPDLMeHD8osYUpJcbEAyN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1zUVr91; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1zUVr91"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso1772935e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 16:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747179987; x=1747784787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
        b=U1zUVr91rkijmwzzZEd1pms/MXkvhNMKqieR4xIbA/zZLLWifIs18F0b0cKysNm3s0
         1dEQ2LkwYoVkhuM91Wq15UGBGjcedJkwJIRsDWtyLk1NnDCiaHpAp5JXpGYIWS7LwfpS
         8rudDP1YDjlCHguJZv1RRiOip5aIbRjym+fGpJqG64BwcM0eibWGnHuqFMu4CQi+ep8z
         Ccit9aMMQqD3PKkvPOlvIn9eIz42pgeP8sDHmMjHNh/VLSC7CjfsxkyUacVocDYUC05d
         xnoOQlCXXENGTyPJGgv/lv6mze25PEjTR9XCthmPt2XkY/C+ogbBBR6VxJg3Ea2wzIek
         p97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747179987; x=1747784787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
        b=Jim2WTBjNUGhVyDSKyHIRTPGLAEEckKa5c8sf34qWsPBQ7mFPJgHXta0xxZTSLIq+X
         o4h7C9wqkKJ+w+6uvdn8aU7IWtJwQKtMf9lGHDoKnXsoAmUEpnR1B7DZkZk9DB8SlO+u
         BsT8s4frIw57j28eyrWyCahmYqG+CpUejQ/8IFw4oBOYmj5uCWnv/0igmSbY10jEN3+9
         xX3GA8LwuWc/d+5ETcRQAdKzGmrdSXlmX+akoPwnqf14Gazy6mfcoDcPVG3wRgoCQ7cp
         Ct7Hm6pqQE+cqYh0MvdxBYNw4mFRCSxpq7zy27Id7ircka+yMMHMVG1xkovhd7qGe1NB
         F+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWnb6e+biLRQVSyJIWKJ6zPu9jwL/VMG59Lkb4YF0HIj6LDEyUC1HahgBQjOXBH5KnLK4vSO90eepvIUjSrMG9L7JfXoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOIK8sGZCgdVtQu8p+yItj9Bqcb4bLO6hMaaH2srU1r31VHTvh
	lGNFoYgluvFFLJVVg41BgCpYqJMfvVPxe/FFUr39eXVQelkS3CjB
X-Gm-Gg: ASbGncsWcMtQqiMIpqjCkbbqJm+Mpqy/sdfSBNB4Tym4r+KAlBJHYWSmei9n8rgSd2Z
	LfVWXKe0Ys85bDzpW+19fLpJqOD97iUwTKPilYsGhk+ZMN4TeNjK7bgVXl5mUDSKxVLjA54vw/2
	GjN8ynxQrVccfFyK3bG5JtUSAvhUW58K+ot3NKnErQIFoXkvc/afJ7eT4Q83anxhC58Up5Fhri3
	x8+KAemP6JElSCei3/R6xGSf7SJZMqKs1by2BbaboPjX2ZRs/eBzXgq3kbakO2I9UfhkJXXhjgC
	fsBgwshkUomm9eRVgTrASLpabNr2GDRLwdO8k02H6mLeZRUoqP5lxzOTdQYBOaJYes/Vpm402ZS
	4MIK387bEjZo8
X-Google-Smtp-Source: AGHT+IHSw2JHRvnitJtJa6AdYdxRDFYEo1OfcoOtexkTf6XFYzq3VybGtqZnXlr+zjXBLXMGWv0Flw==
X-Received: by 2002:a05:600c:1c2a:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-442f219511emr2834195e9.9.1747179987106;
        Tue, 13 May 2025 16:46:27 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3369138sm5670665e9.8.2025.05.13.16.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 16:46:26 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd: fix kernel-doc parameter tag format
Date: Wed, 14 May 2025 02:46:21 +0300
Message-Id: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
colon after the parameter name in its kernel-doc tag:

  * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...

Kernel-doc insists on the form @name: description. Adding the colon
eliminates the warning and ensures consistent extraction into Sphinx
documentation. No functional changes are made.

Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.25.1

