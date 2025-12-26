Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC231448E0
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Dec 2025 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766728691; cv=none; b=Jm6dr4b2ecPyaMfSExuCppRssBDELGpW7CLscaElnS6FMIsu15eLkS5AXz0smzkz0Vzk6Tdvasq92izNfZ7XUPVBklFA8+yemtXi8gn5wC7ie8IGiRjBTfnB+RsuL9qYuTZgmNb2SF+FggVeBn1M9YeFGWfper0KCDNTYGafmQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766728691; c=relaxed/simple;
	bh=emkMh02Q6ttc7Q/RZPhcfOPMT53pTT0Ad5hIy77TNBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8PLlELnfo8CXeTKQpkG14+8xCag54JDVgEtn1wy/5zG3HZ+CUmHsKipH5momf9hwy9JsX12BCEsB9BFRgWVx5Revn8+ih9pPDuhd8kj/Q36xavQNXOQqyvdbd88c3OUuf9BDCcO2wwfr50vP/lvEpHVNxt3mK/CUnk5fPuKZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE5j9Oki; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE5j9Oki"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-459a516592eso761473b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 21:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766728688; x=1767333488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwiw7tmLfV8izGYWwiiJT1zXhrZjZ4Clv168Ox4HqPw=;
        b=TE5j9OkiJuNf5DglOVC1FtRyYWPBERGBDqPlb2GeiDW0rS0y9KY1OCO3WNpS87n49F
         LHZGDYZCvpfnagSUI3RRr87u9COByp2iQqUKAFrYZg65uPvLs9s+5C5e27EO1v6ZVZr1
         E9jZU1EH9cz32HcwbBTwOCtR+QVV96vjHXeQGJFLSiPSChiV09voABfGAi0caW00hJw/
         zQSYn8yCjstLXP3l7g4CpLr8XwCjo8JMtcEmXj6t0gYlQdFTaqCOaQ0xT/ELYl93JxhQ
         jlac4GZhpJUAOFZoTKp9J2Vma568vRibRW+82ab0sDfmRAuioEC/U54XoYU42Kylavb9
         Y/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766728688; x=1767333488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwiw7tmLfV8izGYWwiiJT1zXhrZjZ4Clv168Ox4HqPw=;
        b=NMg5z4JZODv6NxvuJCQPnGKj87/tL6Itmj0nlZh9v2U9d/8Yjqf4rUjT6rJ2mk7mTX
         Pcpr8QMha5Aei3YYjY+hrhYqFrT5GOcUxt48N+RW/14ACZ3TZQdMMoHhh3adz7C+4XnF
         Q0FhDg0XqbjWxMjHyS99MahzF7q5YwgreehNJ/f/fcupwWVjK55LzdifZq+r1AE/iOzv
         mRjPYeBcABgtRP9GosFpnyFWLpo5kim0InBIj+XfxahF9a6a9CvP/YXjQ1fjH7NxFYmU
         5ArhLHrXxgz/I2tLYdrmq5LHaJFse1TZIHhacmA1YWResPOEiSVhran3DOSnPpO4elF6
         c8qg==
X-Forwarded-Encrypted: i=1; AJvYcCXza2QiZUHhqP/aqvbEtQxjxxQZrC2QZBFtKMba5wJU/VE87enLuA1hHg0a2fHr4vCooVj9JdZTjaq4nmxM3BckGxb+Mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW8ATGI/KQKF4bYvreEAeGSEO0E0J9jEM/xN137LGsYwBr1Pop
	myI12N3ABmlWGvDHxM5SjY58edb+yOO5NC6T9PAZsYJ0Zo+lhyg1ekG5
X-Gm-Gg: AY/fxX7HZ/rd3TglLeme/vJFtEpm6BE/Ag2z6xBaykE8jV0TAKDkVrrT6h1Ov7p8ln5
	WZgPCTLgBw/ed6nYYVmZGMww+Mwgwo5q7IEzeLCoGsoPqxxUjYOJA9ne6ifYhxcHULhkMzqvQb9
	q7H+/5uAR1h7bB8DjJ4JokQ0uf0o3NV0MHSTrsJdo99jedPmtKOjLoJQFDZ5SqLBiDn0YgAqvGF
	5rsqVbPExulOEYZVDnObAFmTntoMJTMLt5kB2MiKFshdMx60XQNEfOHMauxEWWcxB/baUmAdqk2
	qfoo3++Y4wqsMEtNoh90BOCxj696arVRBBWBZ/WC0XtznWNLnfkT5GEgBtGcwVJQTGUL2aZz39b
	Jn8vFOl2glI3yO541j38CkalPVs748jXWmBIh1B1r4DyGHmArVZQBDkSvJsrkmD4Z4KgJh15TSN
	xWBz8bOUcEqxsV3l3/z/rd/GI7XbScdshYVln8b1CiAEWhRTGJ7/yMXValofc=
X-Google-Smtp-Source: AGHT+IEbYXMUaBY1WDYPye8ZFTP68iAFQKXwvIJGdrgeoPkqJ++gNaoMC3ARxRe+0RazTxyn93cW7w==
X-Received: by 2002:a05:6808:8851:20b0:459:b569:702f with SMTP id 5614622812f47-459b569766emr697392b6e.15.1766728688464;
        Thu, 25 Dec 2025 21:58:08 -0800 (PST)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66645494sm14532416a34.0.2025.12.25.21.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 21:58:08 -0800 (PST)
From: Adrian Yip <adrian.ytw@gmail.com>
To: stable@vger.kernel.org
Cc: Adrian Yip <adrian.ytw@gmail.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 6.6.y 0/2] fix push_nsh() validation + silence selftest warnings
Date: Thu, 25 Dec 2025 23:56:03 -0600
Message-ID: <20251226055610.3120437-1-adrian.ytw@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi maintainers,

This is a v6.6 backport mainly for an upstream commit `5ace7ef87f05 net: 
openvswitch: fix middle attribute validation in push_nsh() action`.

I built the kernel then tested it with selftest. The selftest that ran
with a a bunch of SyntaxWarning.

Example:
  /ovs-dpctl.py:598: SyntaxWarning: invalid escape sequence '\d'
    actstr, ":", "(\d+)", int, False
  /ovs-dpctl.py:601: SyntaxWarning: invalid escape sequence '\d'
    actstr, "-", "(\d+)", int, False
  /ovs-dpctl.py:505: SyntaxWarning: invalid escape sequence '\d'
    elif parse_starts_block(actstr, "^(\d+)", False, True):

This error was then easily fixed with another minimal backport for the
file tools/testing/selftests/net/openvswitch/ovs-dpctl.py. Hence the
series.

Both patches was applied cleanly and was tested with selftest and passed
though the timeout had to be increased for drop_reason to pass.

Adrian Moreno (1):
  selftests: openvswitch: Fix escape chars in regexp.

Ilya Maximets (1):
  net: openvswitch: fix middle attribute validation in push_nsh() action

 net/openvswitch/flow_netlink.c                   | 13 ++++++++++---
 .../selftests/net/openvswitch/ovs-dpctl.py       | 16 ++++++++--------
 2 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.52.0

