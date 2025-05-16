Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9A12222D1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389921; cv=none; b=m5AuJB/yA6iSvFb9T9eRaljQyWfg1i3A1wOoJYMrtw3favEYkHueeGbLzuwi0lfMLVA/C+lqAPfXA7NrCevQY5Fr+JOa4/PX+v7ORgNehF/lttO5gNSPqjS6MnWId9RbT5RjmZeJfL/7kMDEMt34ehMXtB4c3kjObCWXZjeKxzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389921; c=relaxed/simple;
	bh=/1cSL/Lh7tlBOp4/gUuenclvwCFSIFtB1YjDaNqi7c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icDYRq7CmXtc0q8XAdXUNmdbEY7RBfx+L5bEMwzCUcAoYtrEci3bTAbHh9BqBaYuP/1H5z3E/TuprHUA+GEv2Nu4rrGYh22U3v9kKvUnyOixEifptrYFpi6AiyNKZ95CtrKO7we+sZdWlBLm8skNDFQsPzwXItpnTl59dDEdCOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbJXqNVW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbJXqNVW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231e331baceso3118955ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747389919; x=1747994719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFijRLgGDoaMi5lWPDlmsyQ4o4dXkE7VloEdKbWCl3Q=;
        b=IbJXqNVWBnvuzZZgokpl3vwkhFUPym6X8aNjXPrh5ZJsIMG/oOiJjxSgonElC4VQxt
         EhxytuAS4Jk/xzIrsDZPVD6xf+/rfrKLk2xAhrqzDN+Qcty4M4u6NNt0MtxY6pXgjLUd
         5gg+OLG4lRrd47bdpTwngW25PCUV0zaBA3BaBEyrD3AAh8u6/ptR1eGIbZsdW1huIcHL
         nRZQr4efJzp0N8oTSrrG3z4LChGuDTLTFGg43fspq8LKdyA7oTgqLVQqAtWusWn+X+pE
         ojqVEydewHxoaajhYVA/uJRMInETd0y9YO5i63tQNqxsFVbtaLtVyBqP16sVK3ujJhu5
         6dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389919; x=1747994719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFijRLgGDoaMi5lWPDlmsyQ4o4dXkE7VloEdKbWCl3Q=;
        b=Y/6HjsEEjH+s3LzmF/ggH8GgXQh7/Q3xhj8WEu0wqT3gtvWNN/AiblOldY7FuM/zl/
         eJV6h+d0VxVyslJgirVqkSAuceXTAhSuNFRFJHjuBzgDynzfJ3bJFU8uX7pe8hUIlo+X
         zk/5ZoGwplkMnmCjOMy9smyXz+djfqoaOJLsXj3SrLLfGhJLcyENOXnYQtxEjAuFgSop
         OId2HCXb/x5/dt36YHQACaTFf/GkXQTIpr8UfsppZtkjsc6lz+/RGJB+ryTqlvDGXMNm
         FXIo+oZp29hWBQz3NoDmouqHLwPAv0n2H6V9L2OGu5wScSwSdgs6DkvIsaSKhJb/b3Rv
         lwZg==
X-Forwarded-Encrypted: i=1; AJvYcCX+T/BYpNBsQG9sNIQ/V5Yp9Nn9CvnRgABdPXidavb1x0vrk4GEmKERi6ORJVIjsHIO4Lr6W5ppsRtBRzmi1Iz65K+cGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgJTi8UIGZODJetxtm89uP2xqVVK5kCQIpjsOWkR8r91n3WYQo
	1sbeoyvqupeUTt1HeYEVErxFl2hnf2uu0NuV3nNxAp+MU3H87gxOMCRU
X-Gm-Gg: ASbGncu/saKEcTDoS3nP3tyq334/BPmPNRfFxa/lTIUTV1Xoxurxmulg1g5KRlaL0Tt
	B1M1qo2yBLMCNBUY+TIhOjMzGCPz2Ejhj9VgTEnWU2DV6lEj5nU9IUrFRqr7c/YZgluXCPRgQ+2
	NaxKoVrLPSRjodAXkN2sf92Z0E8/gdX/IOgda2Eqmy39brqDSiWBrezED67alchNY85pGHy5Ydx
	hfWy4xCMZ52wS5x2Ikoyh1YHRblBbwpPGpS5N4hKckD9/zPU7Oxfl3laSMnMMkrYi66aImDMIco
	WROHpAF5OeZpMVD+DffB3hgUiqoa+rgD0SEo/+B7PYOrwu4CNEvH7eDvJjTOWGo=
X-Google-Smtp-Source: AGHT+IFnBvl/fc5vkXH6aoPRzVyKb0aBPkGRkmKPOR1gB40ebLaewudBvyA06ohiC/L+TZL2gX7XJg==
X-Received: by 2002:a17:903:24e:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-231d45ae355mr38262335ad.53.1747389917675;
        Fri, 16 May 2025 03:05:17 -0700 (PDT)
Received: from harshPC.. ([2405:201:400a:31fb:f6e6:d112:b6:cd3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9828esm10988575ad.114.2025.05.16.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:05:17 -0700 (PDT)
From: Harshal <embedkari167@gmail.com>
To: jdelvare@suse.com,
	wsa+renesas@sang-engineering.com,
	skhan@linuxfoundation.org
Cc: Harshal <embedkari167@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: i2c: fix spelling mistake
Date: Fri, 16 May 2025 15:34:38 +0530
Message-ID: <20250516100445.8484-1-embedkari167@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix resistors spelling in i2c-parport.rst

Signed-off-by: Harshal <embedkari167@gmail.com>
---
 Documentation/i2c/busses/i2c-parport.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/busses/i2c-parport.rst b/Documentation/i2c/busses/i2c-parport.rst
index a9b4e8133700..4cbf45952d52 100644
--- a/Documentation/i2c/busses/i2c-parport.rst
+++ b/Documentation/i2c/busses/i2c-parport.rst
@@ -84,7 +84,7 @@ Remarks:
                    \|
 
    must be 74HC05, they must be open collector output.
- - All resitors are 10k.
+ - All resistors are 10k.
  - Pins 18-25 of the parallel port connected to GND.
  - Pins 4-9 (D2-D7) could be used as VDD is the driver drives them high.
    The ADM1032 evaluation board uses D4-D7. Beware that the amount of
-- 
2.43.0

