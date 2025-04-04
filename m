Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC2125DF
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Apr 2025 01:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730108; cv=none; b=jYv/73M7QL4882NlLAG8lvrG08GmlfB/dIhhfvH2Pa9+PGl6DGgbob/5DfYX3gxEMtXd0LmYqm0oH149tlndBm8A/PIPZCiW1r9Nu7dSbFajTNKm0jaQIlPq/4ZAfbofpmNLQeG44XuJYLc05k7Y8TNRuolsytZlvf1qn8D5FM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730108; c=relaxed/simple;
	bh=5+Giy3MvQ8w3Ogn/b9n3+xZekKG1FsumBjZO5LtSWtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xe8GVqaFWuau3cY3/7Z4d3utafREbHC/67X8bxjTohZ9Qg3ZNS1oDo5quf/qyudqluY4dt7Br5TfpX8TabfTO6wX6q0QAJ5PiZVhbh/NXDSg654B3IhsplfL1WHZHgwsnhHowrMQnAxFmUC1S2FHwSTakC87ikfgmdj36jRAEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBT4LgAz; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBT4LgAz"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c59e7039eeso209740485a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Apr 2025 18:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743730105; x=1744334905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5KehqjscaqmbWM/FF2IgUe0rMAoDoCjxIkxHlSDOuQ=;
        b=YBT4LgAz4xjwVElwOM7va5YDraFMy8J8sNj44vtjgN2yACnJkn/tp9NF6KtBVj/wJE
         +fvvKHtJvNfqsRqs/1TiSj3SJseBLhkH8RCq4stekGaMappinhltrzIu0pIj7lDETwJK
         AMhj2j6C0UvSsj5R86RAPDqWI+BOq/aPI6AhbQqET6heJr82+EwglDeWt3VqhVbdl0z+
         iJxG5hLIHDKtwSVoYTVO7eqFuK+ETZZCPqM7Z60LtPfZhAowb1ru8kpfG4JOdBls3+ha
         sGOZiGhZFLDfi4bpMUwPuPbXv1+m1Uyn8bLp9y5C2UsNM5gr6AMp+2ShiVNawF+4qyRl
         Irag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743730105; x=1744334905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5KehqjscaqmbWM/FF2IgUe0rMAoDoCjxIkxHlSDOuQ=;
        b=VOfcB5AZaldQ9C2hD3YLo9vPTfIJ3oi/WUjTSJ349/pUXYRZ864N2nAE1VpOih8t8/
         ibTAK7xY1U9Kkf/vgiPwMshwr3xQfCVKohYaeUHzC3qNLbhzL7/EQ1cVLj1uvdxKlCgC
         p6G463L3K/9XrwTx0gd31RtmoJCIChCE9Ez4EvSG44Acxs63sTQyYnPX95LIQArmsSge
         jsHVJ/DsOfAn52hzKubYBxmQMapjS0hVEvJ0m5nvlHGTtKwlOVjySUeGMQ/elEX3ukhG
         STUyTNAyyesCWYCllFyWgybIo3yD+AesPDmcPrsETd7JATQoA4kIREqBeigxhScB3g6A
         m5SA==
X-Forwarded-Encrypted: i=1; AJvYcCUInJvXDhdjaZmp41YHyXNwgpl4yA7ob8zFX05h7R2rbMWy85H/umxEgHuuv2kNgz9cjdb3frUEMCT6Xj6ItgzOhHqERw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzkurcUnDgJR8euLR9Pldg1NG6ut0y3DnSVJAVk1cBOu7OUdsV
	71SVfrOnr1rcbGippmfP/+92hWzWi/zUL88sZDBG/DGjj8BwcPPe
X-Gm-Gg: ASbGncu36BS5mX+dWfZ5KAkvBazW71rVl4Go7omazp0S0EhbRGx0bVdJXQstKMkSB+W
	ii8WLuWNiK2rNhxabhA6hDpJ10tNf9GwfdNJtkgYbUuCL6K48MLAiZ0UTbxzCwsulSRSFDQZWMK
	QgPJdjmVDSxSiZSzEvSvnIcgDEb3GQQ3UYZx+BiVgcsTKoIJTPOd1IY5msjoV/YvtUIsM0kvUhM
	V8Eh+NZEZvrl6dNmYostmjRkw/tZyLjID2CSPiSnDO3A0ZoDFEQvQTi04uf+KRtv1Zsx2koC/yA
	xw/RGx5qdH5QjnRKwPpLcIGJ2xtOF3/Zyed1jUQZERPP/D8tO02xgU9wvYwrO7mtzJQlD5gFpwG
	LwT2uHlop+mDB8atFNnwQQGA=
X-Google-Smtp-Source: AGHT+IH8rF5SgsSKXM0L1XV5g7fJdJDCNCo+lyIiVL3Oc0X593rI5DTIOdeNQczN1802u5TCgxIfvw==
X-Received: by 2002:a05:620a:4484:b0:7c3:ca9d:210b with SMTP id af79cd13be357-7c774d277b8mr183533385a.6.1743730105428;
        Thu, 03 Apr 2025 18:28:25 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58f95sm147401185a.80.2025.04.03.18.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:28:25 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: kent.overstreet@linux.dev
Cc: gshahrouzi@gmail.com,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/3] This series addresses several minor issues found using sparse.
Date: Thu,  3 Apr 2025 21:28:19 -0400
Message-ID: <20250404012822.188485-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch fixes a typo ('\%u') in a format specifier within a print
statement. The incorrect sequence was replaced as it didn't appear
to be the author's intent.

The second patch corrects the type for a function argument to __le64,
which fixes two related sparse warnings. Although the argument data
is already little-endian, using the specific __le64 type improves
consistency and makes the expected data format explicit.

The third patch ensures cpu_to_le16() is used when preparing certain
on-disk data (directory entry lengths). This maintains correct byte
ordering for big-endian systems.

Gabriel Shahrouzi (3):
  bcachefs: Fix escape sequence in prt_printf
  bcachefs: Fix type for parameter in
    journal_advance_devs_to_next_bucket
  bcachefs: Use cpu_to_le16 for dirent lengths

 fs/bcachefs/data_update.c | 2 +-
 fs/bcachefs/dirent.c      | 4 ++--
 fs/bcachefs/journal_io.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

