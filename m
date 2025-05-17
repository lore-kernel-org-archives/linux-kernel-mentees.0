Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D515B1AA786
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747516252; cv=none; b=BtMloZzxZ/p+rwVqwtC3RCDoDxiabx0wwvHe5HhV2pTWcAHHhMoQtD2w2hkdrp3OHabeae2iadJNoEM0bUUFvA98x0uz9/p8XLcY1InERsDAkJT3aZv7WtouwJl37bBMrZrybjgSjyNnn95KotmI8zP1io2C3tGn09BLwZzqYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747516252; c=relaxed/simple;
	bh=o/Nya/tGk006xRA5N500QpaY5OOYSf0gkMPQt5ZX/IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dn1mEi0e51YOF7uDKU+y4w0JeXqwkpff+LTX1H2PxZZPO+YNmUd8BlRRJ9dHkIffo6kuwJrNBU4k4L13l439uv9j0TiD5ZcKJCYCN6O8EBhILfZ6CX+6K4HR7l3vPcMnISUb1ngTyEniW+ix1Evn0UQsjYlfykPxjLBSZsxD8sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=lyD1ucMT reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="lyD1ucMT"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3da785e3f90so17689385ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747516249; x=1748121049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=lyD1ucMT9Dlz3SSCdK1N9ImA0kf2ZN6xnd/iJQ0YAFRjiR6UVWh/StuKE3RTHUfIDB
         IKnu8yVVbk+wDaMBLofGebjlnIVKwJeKrf/wJlWv6OhC+YXgHzAFsRQKK3uqD8Z3E5b9
         s8F/JRjQGBH02rlbUqfh4YhR6FukYBmM2YeTICtEOmsqpY8yEtrugZXCrLEMoF9vKWMX
         2x8gipOzktvzUWTiB1BLnWrKkAjxA+JZvdlNbKQHBUeS5wPt0cEjfX/IqscVcvwk/a6C
         +Z0HLBAuBXgQIyrq0m8bM1EzEzXzQTg6QmDB+fKGq+JsjJSoQ3+MO/cUFYJQ+h0yR6eu
         EiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747516249; x=1748121049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=StFFY12vjnmOE9YxL1QdUGDZFBfxBbKQ+5RnHwUgfp9j7Tgb/6NWlmwwLHkCspmsbS
         tLLkXsDFjyJbgBLR9KYBYzKXOvXe2RGVdLu6UQDOEbsrWxc7aZFxJynSQS5qHEIZHmRn
         6FqclnQjgs5/FTt2ZhqqykLUAmw+TxaMzt8O+EX0SJeiFFDr23WsBfTnXGr/DHWNgIwf
         3GF5oSbPlFSX7sPPOW9GkpYeQIk1IDnsDng33j0EJZfx6akG5WVxAz1XV0loPOddt987
         zimnwuCGfc7t8AmSTgEsewkK01u/WjZS1yBif5dXVuEYHFU/7wWIYXHX8K+aoOSQC0lb
         aUPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ezBUrcxi43xnYWFlCQcE+5NDGmi5XxKZ48M5YTQxPw3LqLVlX9VOY1KgVFmoRZhpIA7V4ANDFPxG/razArNUA81G+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0CD8ZpHsv3ULj+DU+ifw6fUcf3tnjJi7s8uzGy3yvm3s0UAng
	4yhJkRBzjtYLxodlW0cssnIbxrA9kmo2E6ZZirlS3HvaPjGDGfvSsloAYm87JilhhNc=
X-Gm-Gg: ASbGncv3FeiZJwOa9YGMK20bkIQZPPg4OnS2S11aBNAUJnkeWHJWz6LFTJuwbZQLvDX
	BLMqY3g0pFEUQSSeeIXn0cVmnCJQ6EaRNRJw7ILRuvg0XdEF1ZN1kE0UeXMFhMEHmS3DwS22Bsq
	jFKO6SnFXBkNOSiIavGFh0pDrA8C2yLMR59zTjxvIurq40J+XebjVEDyDnpRSalQQwptBhfcIAA
	oyu6tUCtitRJprfnJvqWaClUDF0zZtD6rQ/bmhzlSk4J10CCdUwjdpnMTwhZLL4ogNQ12YAnECC
	Dv+EWXm24j0TaBKLw6m3Sc+qSmOp6DtIp5wcnJLHpAzupKjEqZweN1D3BUoNo+sz4MZ7hr9oSLb
	PbtuHLV8=
X-Google-Smtp-Source: AGHT+IHO8vmPZ9wtEiIB3JiDHbb2n/QkwioIBKsC0rUUGe/Wln0nL1EQukSNTPuRfRNcvEViMy2SvA==
X-Received: by 2002:a05:6e02:1c02:b0:3d9:66ba:1ad2 with SMTP id e9e14a558f8ab-3db8569e88bmr68385155ab.0.1747516248818;
        Sat, 17 May 2025 14:10:48 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843e07b8sm11777445ab.20.2025.05.17.14.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 14:10:47 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] docs: powerpc: Add htm.rst to table of contents
Date: Sat, 17 May 2025 15:07:59 -0600
Message-ID: <20250517210757.1076554-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

