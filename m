Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274962F744B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541974; cv=none; b=eYqVU6escVLH0CWwIWRY8vcOVNa0lbFoqnO+8LLssD70PP5R59Mk3CPN5lT6iByp72uaso7pGQdHF8NbKXCv4HqSAgln1jMFX98H5iW/Sy9UtzOXOzZVRX9FAzIoNVwbHqa18sU7Ri/NqSEQMBAa3//lu2tQuYmfJDTxdpP2Hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541974; c=relaxed/simple;
	bh=c+xJXWz8nJ7TMLjQLredolSTZfMUIhKuR0ZiBPNE4zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rm/JzwKYfzIadHJhkIKofw21/6bU1qaGc3ea94evAS57iIAZNxnhYP+AI5/p8dULOHLAoca1uwNkxRI3GT97DBDfNeQD7pyn7LItkXuKXKYvW1DseFeN5bZah7FIx5eiZyEswK0UsLuuimGjLyg0E1kJlek6p6X4OTezaQnEn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQkfojB5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQkfojB5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2681660d604so72833405ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760541971; x=1761146771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7O0CpM0/C7Le3z3rkyQRvc1X6MxZb/suwRe01ONJGns=;
        b=MQkfojB5CPktbigGMS37rmu4zlL4mWinVGK90AyZP2bnNR3icDGnhNVjQeA+nAxfUd
         9oyRVfOZpb2k6jGHLK4HPy8M+UmM6mbqS/ImgLle33GQT6ea5vXTbElUZzEcpsnzktok
         3PIkdRCvQaghDRaTvHriLOgtmCthJPw70r/3hHv1SlxfDNwa8bhBvGLvxMdsnPbofld5
         HOT3ciB9lsmQOVhZT9EkSJj6+zInqmohJLjobMb9Cpc0ZQoV2BL11FYw9Z40P9x7K9AG
         q2K0mV7qoZc2gwKzoDWve6Lq5mG46o+v2Hke3ugVGpB75RjMFRv8ei5i6VpxJr0CTnfd
         fxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541971; x=1761146771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7O0CpM0/C7Le3z3rkyQRvc1X6MxZb/suwRe01ONJGns=;
        b=oeH2pSwAw/FWHUlYF8yLHU9M3YxheDUw0bYLvx55d0xrTw80fGiXNPtTu1gbxeN2B6
         dT37/rZ/kT3TXUqG5sDGaDSE4UnRJa+pYCJIng/rNL896jsO92+y9dw2xWtID5dA+2VO
         OcKxXD5cDot3RPnzvw0ouSZ/gyOKptcaMLg3umlo5uu6BoVuIrerpmBD5c+QLlO+LX7k
         k1b0AWwmevm1fSUMiBk0jBCZVUAAo2QBpPT8XTZMvF2Hql8SHEoWtNpPFOrKLDtGcvvb
         bKYbDCCdLOuJ3rXzHu7W/8IF6Cw930jk10hjbjHR/fRnPfjXhcZKlZejJ6bDMqbUgrSY
         mcZg==
X-Forwarded-Encrypted: i=1; AJvYcCWnm09iDx1uZCGgETzC7wmp/76qKUZicYjLrwCEE8HPG0OwWIcGFq2d8+qWekFbo08YP9uZ/SK5EelJ0ksY1tWOlNh3eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHnPV97i/Ee494MXEQfIHGUn5d6hPSiP40bJ5YPJXl1jqHSRTM
	k4c49clzezYANprdBN4HPf5vEMjdzuiBQI8w2kO+suC5d21DEiqEBJOh
X-Gm-Gg: ASbGncuak+2poCREbWStzXjN3bHkV38GCZvh4Vl3gjSntj2rMH+wpSqNXcGr+nwRXRp
	Q2LdVsKqh1NdtE+6qzpbZaNZRQaI4JzIcFdVGD9kpUxR4OiaQ3CGYajHEDV0R2Iv9Y/k1hS/uyo
	9VAi9FNjCIj4gdAJgMgG116t/MdyKqfxmaldx5OycV7AiyqnEgC7Pi6esoDGcnOqUnwW/R6Cwaz
	fiuRP+mmQUQ97cfUHz4mxLEyIGgDAsIlQWlc3ao2hrc6JKK/Yr9HR6N4n5HIbQ/sF3ES123Oy1M
	1ayp+hA7kNcWCdJtsQ3xiKzhYPaTnXtvaI5ugT+AaV+pIFsZ18RaZceGyK2i+CMniWfJeNgnet0
	mwfgvfLJoWgRuZRjxvuin1+/sA2AGYHcP6gU3vPWnuCrAE+8=
X-Google-Smtp-Source: AGHT+IHPNdtXsGrKiyWshln4Wfw606m9LZSh9VEYZ8OFWOsKMEwpo9QsS2xbGC5lMHJGNcWMCYwM8g==
X-Received: by 2002:a17:902:cf11:b0:269:7c21:f3f8 with SMTP id d9443c01a7336-290272b498fmr337396675ad.39.1760541970803;
        Wed, 15 Oct 2025 08:26:10 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05c2dsm200607325ad.73.2025.10.15.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:26:10 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: bbrezillon@kernel.org,
	himal.prasad.ghimiray@intel.com,
	dakr@kernel.org,
	matt.coster@imgtec.com,
	robin.clark@oss.qualcomm.com,
	matthew.brost@intel.com,
	aliceryhl@google.com,
	thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Ankan Biswas <spyjetfayed@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 20:50:57 +0530
Message-ID: <20251015152543.24368-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
instead of '@map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250821133539.03aa298e@canb.auug.org.au/
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
Changes in v3:
-  Addled Closes tag in log

Changes in v2:
- typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'

 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..476990e761f8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.51.0

