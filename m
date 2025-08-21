Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC206327795
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782245; cv=none; b=AyXzdJCnr36ge1OoB055nMp1Wui0V9dNPxqk5uaaSBK63TTB5uCIa5wXCmwl0jsEXBsYNNnhPM0OvUMFJIGzij8GT+++XYzC+nmLar4jgICFD6uPWRtncDMU1oCL3TWaoa6stCDC68hM4gm+13s4uXjcvvfrnkCCkE37m1zaCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782245; c=relaxed/simple;
	bh=BfUFIpKi0jNSO8qQJnc/RDNHrnU9cLghiPrJydtwd/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iE94843xgj8ZT+zT4pQxu/5TwZOSedn6VhIVlG/vw0pneB1blcEhBUP6VgvbYFmsiJ1DcCtfNbprGXcJIHthObKJeAKo651moFaD5dcfI+9u4t7rO9HHDkBL39/6/q4GRwiCV9vrEukzDaZ87ZjZJH9Rq6L2vDpOXxlD/0dXW0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx3PcQgU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx3PcQgU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so142743766b.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755782242; x=1756387042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YergQZ9XutIei6tpuNz/ymS/WZO1vUxU6NUoUNtJ1kI=;
        b=jx3PcQgU1srgsc/Wj7PwoYnrzKfhOYhJrd4sYrhwjlZTKbKQSRqBCHuc1CJDbhzus+
         QbjrEJkTzop+ssCE7duHbIUySEKpl9J6V9HKeJ1hXTEzfe529gz9utum6HzXjnBRkrF4
         JG7JTY9glo5sjIJ4Yo3GEHc8umdGz9YxX5caBZK71frafdsS733NW45FXEKIPajQjJZ4
         PBnYq7mPRgv0aqfejg5c0rUhiDzwNjQ28yRi1JyARnPyI9IPYZ3rOoWXuegTskxNnQfA
         8BD4u+6efid6dtWSnspDmsPYwkINrAIr/G4oOaEkU2rC0ssED28VX2YD/KBUi+x5KFKE
         cXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782242; x=1756387042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YergQZ9XutIei6tpuNz/ymS/WZO1vUxU6NUoUNtJ1kI=;
        b=XPfbNVzi667lpLPAXuQwftYjxhGi1o7kxVD2uWLaEPvmlBo+mot/coXpmPjN3U6lPD
         awq52f/1l3XSSmhFyRo3umGjEXnBF1TG4JSI2OoCA1cNsdgTzjKa8WbeAk+52keglhV8
         rFpRRTXndmDczJO81eIHeFUEdTnyqfitFr0vd8LCRGZPRy7lDSkcgXlt0a0MQveCd0CQ
         1jkUq/rjrR8izcxek5cREdmJ5wlPPc8XdX7DQvqfol8Tl1UhjVYEe+YzsblFXw9WjBEz
         TgV/IsrB/CvTX1Z2jS6XAFHNH4pJJf7mGJvt8hoPDBhGvQ0pZqmvByI36U1/c382A/Ah
         +svw==
X-Forwarded-Encrypted: i=1; AJvYcCV7dZvUaHETUe4rnyOrdMtN+uLY9aXNn/MAdnJDFOKtd125DwcId3i4y7e2rlUP1pg01KGXiiARr1C2vTbDnXICGKMQvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFXnplhNJEDwpSUBbuHE72zpMcLnXhexTLjjStkUepk+sOYonQ
	Cp0D6oAdB8qpNNynW+Kb0Wymla5T6Pllx3w1H/3vUilb4zn0XQJTM6rj
X-Gm-Gg: ASbGncvk1jqCwuSWug1xSOileQH5JeXeZLnxDUfKosZv/g1IX079EkDCTuQ7px/GRfB
	VkpZOCSFQQAPHbT3VxtUHcc9NM4z7EC2P9tj2ZONLeejrQh20XRXXSks8pNwnMJ+xiLvbMtOwNP
	SBlspGhO/af0tDmkIHSZPU1Zn0phnHETva8DUwt9vCq91jL3mrLe6sFgauSUEgxuUfftoffxgZi
	ERIjW9WGudfu/OXRkReDmgo0JYAfOwBd80fk08whGEungJlp9/lJBZJY+6HSezL3teZxxav3yUZ
	Vecs0Gg3+6fCGqat3xWeiUgOcRKVa3JMk5npT15Uenn2edNglIN4jYSO86WSzLr2MrObkmnLMNw
	DinZn8Nvq5D3p/ZneLIwMf3CgeP+4
X-Google-Smtp-Source: AGHT+IGb0Fy1MDmZpYB0kO3JQdBxpxrwB4Us7cifwwRvXmL6XzplmdSQCPTzJas31V+oGDqyhOJSCg==
X-Received: by 2002:a17:906:d249:b0:afc:a330:e423 with SMTP id a640c23a62f3a-afe07c09c50mr195291066b.42.1755782241851;
        Thu, 21 Aug 2025 06:17:21 -0700 (PDT)
Received: from vagrant.. ([31.223.98.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe1367efbdsm88671666b.25.2025.08.21.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:17:21 -0700 (PDT)
From: Alperen Aksu <aksulperen@gmail.com>
To: corbet@lwn.net
Cc: linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Alperen Aksu <aksulperen@gmail.com>
Subject: [PATCH] Documentation/filesystems/xfs: Fix typo error
Date: Thu, 21 Aug 2025 13:13:47 +0000
Message-ID: <20250821131404.25461-1-aksulperen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed typo error in referring to the section's headline
Fixed to correct spelling of "mapping"

Signed-off-by: Alperen Aksu <aksulperen@gmail.com>
---
 Documentation/filesystems/xfs/xfs-online-fsck-design.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
index e231d127cd40..b39b588bb995 100644
--- a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
+++ b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
@@ -475,7 +475,7 @@ operation, which may cause application failure or an unplanned filesystem
 shutdown.
 
 Inspiration for the secondary metadata repair strategy was drawn from section
-2.4 of Srinivasan above, and sections 2 ("NSF: Inded Build Without Side-File")
+2.4 of Srinivasan above, and sections 2 ("NSF: Index Build Without Side-File")
 and 3.1.1 ("Duplicate Key Insert Problem") in C. Mohan, `"Algorithms for
 Creating Indexes for Very Large Tables Without Quiescing Updates"
 <https://dl.acm.org/doi/10.1145/130283.130337>`_, 1992.
@@ -4179,7 +4179,7 @@ When the exchange is initiated, the sequence of operations is as follows:
    This will be discussed in more detail in subsequent sections.
 
 If the filesystem goes down in the middle of an operation, log recovery will
-find the most recent unfinished maping exchange log intent item and restart
+find the most recent unfinished mapping exchange log intent item and restart
 from there.
 This is how atomic file mapping exchanges guarantees that an outside observer
 will either see the old broken structure or the new one, and never a mismash of
-- 
2.43.0

