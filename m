Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429341AAC
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863366; cv=none; b=k9Xstljfzve8bl7Awumj6blporR5TmNea/0PH/5bknSxdnRy7XFQ9jd8vl/EbunRzcS9w3ZcJN9Y19zXGWnQ/JM+C8iY7DfkYJtrzzds5cy836sRRJLXANJoo7NfpdsxkAndFZM4Q9ZafgNC8wnhYoJYYdYTYGBwA5C21CmMZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863366; c=relaxed/simple;
	bh=pSc7gPSIF4Ju9Vbb1RvH3FU3+BzuQdiE/nwuOb/8DcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRFX6Syh0DTrarSIUwpw8covehc6Y9nh5fLLthHc1dXqvgukdcxrLD8x8vKUbgwP8AidheZqudVS2Jmn11ZiDtp4EQLTAPyV+8ST/2bEaA+7u1KyqBa1QmptnBKrGylSZAFZNEifospKFX+d7gfUCteCqxqODPNZgLNa64EwSrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeepIvwv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeepIvwv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27edcbcd158so86689005ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863365; x=1760468165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWXmB+0eRU50OqdMozBO7Gp94A6Xe9er0qbuUMERDjM=;
        b=CeepIvwvvUNzoanF1xn4Ze/mZdXxRKSxnN86RvZ4V+nnNT9R4FUtNUtIurGBJciQHl
         ypbDPMTD7LeKkmO2cJK17DhHXM4oWTzbIycjBORDxyRRYG1siVcLZYBmH5M4lZWGk4ON
         By56OCOyQfzGJNZEBxU15kDybOA61V+9axfHULbSB47q4t038wA0ZhJQJjyfwd5u5nSv
         hA8p/5QXwzS8yLTnCCGMPHo2u/Ed0oPBEhkYbKWP+lw5tm1ouIxjVqGGKL6NhymNKqhO
         CIkGkYorlAtmxOkuS/L4Y/u6wALVPm4ypCh+/IM+UXH6p/Gxq7+IbOq3M4RT8Cd0fB68
         8dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863365; x=1760468165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWXmB+0eRU50OqdMozBO7Gp94A6Xe9er0qbuUMERDjM=;
        b=vQ2oMn0fXw3Jql0mXfjBJWXkk0LVSc7JHVG9pezQty/fNTHt/lE73gobW+4SGbHPnU
         8zetARJHyaH33gGU9aS5jZ+vB/OnNewpxZC3CR2gd1caP6uxu8vylCRNYtqrkMEp1vzw
         2AczNL3Vq/WuWgMqgkRMY5xankXawh4+SzIt1oOYYP8AlARoYviJ1wzenhoOYI9QCxvt
         PWQSuHL0mRZP0QLCdiWpmIlqf7wHD1GrQm9QgBPBz16kkSXNSkKH5aT3URM7tD3wqQLq
         zFrbl0QrqR533LUgiY+0/4FjdviDAos2wEUU7GRHcO7XsAetS3FNOqAOjIpWQRvUpRfB
         XKYA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzIcqbNPBgKwafQFSqTPZFPrK1vA0O3ox7Plw1c1idkt0YR2IzB45O5ixUN9lO9MJh6hzz3c8kAmKhpCjS4gFzSRJ3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiF+mn0cGwmpBscBsJXPvBXYUvE8F83pQPSQIeC/P5ThPDbCP3
	z/wr6ET0xNx970URtOCQnwkQiZDoszozbaABdqzf/FsvcOzCE0rA5HJDBpKaKjFI
X-Gm-Gg: ASbGncskUk61GbOdG+epwn8DNpNZNW7MPItPs03k9inCVr/PPj+Fjwy1bsaQzJ2Ento
	RA+caz1QwxYk+KsWUGh0YAwVwZYGQUzzKtJR3o8qjsOwWyUmxTZGRZIYo5lAFXj++bJsr78ujYY
	mUeNNJAEgFwKvxs6qArljqf0J7ZQ5g+RM6ON2OjWoiIIegOMe3a+JxxkTpXx4cSS/jtrna6T8Wq
	UnlhsX4Sv9OC6w7ho10HjIR/4YSi9Ymy7AKLbluxsp0yXpuTOkJ+5mh+2fIck6d7DKwLKzPHvQS
	c6qEXo3W39qf/YBiBO5tSqq5RqhyF6r3JbfEeq69c2BH93vSk5MMUqkf02dSg73jr59rxMH9wQK
	BpTGoyPaqDNMXhbPrnKT0bNmayJzA01ET4NyJ7+w7kPru3er5Ru2qvaRuqHunDabnGg==
X-Google-Smtp-Source: AGHT+IGvYA4pseNCxAD0k16xn0xkIZT6WBhqKdCmXY+O/CgWIym5mkyzdw8u5N3F8B4gY3vtazxjYQ==
X-Received: by 2002:a17:902:d545:b0:28e:cc3a:371b with SMTP id d9443c01a7336-290272f8534mr9092315ad.57.1759863364543;
        Tue, 07 Oct 2025 11:56:04 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:04 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 6/8] Documentation/rtla: rename common_timerlat_options.rst
Date: Wed,  8 Oct 2025 00:24:55 +0530
Message-ID: <20251007185508.40908-7-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_timerlat_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_timerlat_options.rst to common_timerlat_options.txt to
maintain consistency with other common_*.txt files and prevent Sphinx
from building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 ...{common_timerlat_options.rst => common_timerlat_options.txt} | 0
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_timerlat_options.rst b/Documentation/tools/rtla/common_timerlat_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_options.rst
rename to Documentation/tools/rtla/common_timerlat_options.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 61b5b55be96e..f56fe546411b 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -25,7 +25,7 @@ occurrence. This tool uses the periodic information, and the
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
 .. include:: common_hist_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 6f09f30c74f0..32d33c792dcb 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -26,7 +26,7 @@ seem with the option **-T**.
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
 .. include:: common_top_options.rst
 
-- 
2.43.0

