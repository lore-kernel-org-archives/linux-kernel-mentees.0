Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9243C056
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110256; cv=none; b=bagyUb6JS391LX4H5bkkTE1fEylkfftOQwXqdGmjGaOHMi8kNmiUbuVCjkKUtgz3/qyUHAeEM0PH7XdNHPcPFyHBWl9Z1uaw2SHK7gyJg50eJ4N5qs3qGORhYqjyCgPK+u734m8T5esS23Qw1po09tTNBrd+svQ1zV0urZnUq50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110256; c=relaxed/simple;
	bh=JfYz53bJftYARTtQYbhdqLN88JZ2JOJLHjD7XhU/M28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krHuNqe4kYrlKidP1wCYcJDYeuu6US4cBh6N9xTVX3Tp0ZRK9Z2BDMopl0m8pUyIoTmkwy3U+7We7oqPguAys0JMmiCsLveFKhJ8CePHhMijV+BSULeEJeyTrfqLE5Y4gfYYWehUXmahp2Bt9d3yix1JW5zHhlvw9bsLQr7oZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/MqOb4P; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/MqOb4P"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so88025925ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110254; x=1784715054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qXsDMJk4sPduicJj2EHttKleB6YVypYjBplsn4iN7vc=;
        b=a/MqOb4PYoWeM3pzqVotSRrYG2FOmx1pWDH/wRbGdzNj9RGmQI8tPjw0VX2Bj+L+1E
         E02Ofk+1Jj7ceIxVtMcDnH6oALvnCRerV0BlXVbhv4hcUGBnMY12COClabJbIfKoyree
         /jDFIq2RJXtUlus0HyaUe2RiCmfmFbRBZzUy+TXWdeKg4caP5QY4iHFZBV7VG2D/w2Tj
         PYFGtJn1vzDXB8BW5VlmBQ+IL9nlbr+HzAKkkdrR4I/Pj6WlzZvp1fnwaZMJuhkAJWl9
         PScQQ6Kez6ZoKh2LpLzyaK7EZgkPuefY8ECnMp/TOcnnKfKBKMivcX4fM4BoLw41Hg9h
         Eqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110254; x=1784715054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXsDMJk4sPduicJj2EHttKleB6YVypYjBplsn4iN7vc=;
        b=C+oJQvtzliSIKZ5xHHxZnzBijA7KRir0D4w0dFwiLMfAqcWRSWEY2YYaSy6i2g7hxB
         +KOUtQyQOfMNWz795IqQ5w/I8SGi9gXMu+WGGyphhratbbwnEXhX3X3v3Lp3nKEoFLPa
         /09mFELX+GhQQJpVzxMfhMrTrUun6du5M1TxfWJdwtv2mv+aUaXoLp3b9cGlR6LEU4re
         Y1rHUxShsl5/jpAGq4RvmZhpVPfXyr+8VY5L60deO1+NH3IQjTRN+denZbp/uTXNpOcA
         AibvB5xxBdWi6PgpvWbdk7VQxeV0y9dii0j8RXDWb000qtl23WAU5bvclG6jTMZ13zSL
         mJKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhw2UEYBt10HeMCb7izr1KAfa/XV62KVo+35SqWC+N10mugZ4NziVtJs64sFI/13/AkzcT8HZwqbYJCtbf/998LGmNKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ENlmWwMJ28CBTVANgBHXAnK35HB7jWa9O7VUDubwSl36Nf8j
	jUovNZWru7Duvuvoj3TE2BKT3eXWQ6cB6a4dWueSTjvACRDaMaugWXEO
X-Gm-Gg: AfdE7ckS6IBU9hYEdzWo95TEaGefUStuanyCTaA6NMXzSgaOdeOrueByD8yR5qm0f+C
	1NKusjCR6EndiXlfc1zSOZIwNLq40dlM0RabwxW8oJMfgrKKmLUN5ZGTXPhB7JnVy7mQRXXGk52
	5zq/qBQ44dXwD2luc/zVTPyeWMlLcM9ONIrOGkju48KPX5grM2+MyqEdXN7rOm1zg2kWbo8U5wh
	kK0mM6Wrs/av2ciBoeBM5dmRprkYMATSJRL5f0YyD3qyy9PMojoHELeCt92zNUI5BOQ/PAaVaLX
	Mijy6M4Pm2DC3pXE0tkwZjw5RZ/TPvPGdR/aeWqdkI4ayUiVXfifji51dj5ca4aQnmlkDVeYrTo
	IjN3n5JY0PUCxk2fA/BmeBGrP/dLQxWW1HfUmbsyZCA2XwTIL6Hx2y11hJXdvcSDkuxlbKIP+CU
	o2b9OipnubVgHFz5iRCvqRc/1gQJoDIihRRQ4nV3kX
X-Received: by 2002:a17:90b:2544:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38e1af44e01mr6101942a91.36.1784110253968;
        Wed, 15 Jul 2026 03:10:53 -0700 (PDT)
Received: from primary ([223.181.23.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm62079757eec.25.2026.07.15.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:10:53 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Per-Daniel Olsson <perdaniel.olsson@axis.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 0/3] iio: light: opt4060: Fix integration time, pointer type and error message
Date: Wed, 15 Jul 2026 06:45:41 +0530
Message-ID: <20260715011544.281148-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three issues in the opt4060 driver, all of which have
been present since the driver was introduced.

Patch 1 rejects integration time writes with a non-zero seconds part.
Previously, opt4060_write_raw() only considered the microseconds
component, so values such as 1.000600 were accepted and programmed as
600 us.

Patch 2 fixes a pointer type mismatch in the call to
div_u64_rem(). This is a type cleanliness fix and does not change
runtime behaviour.

Patch 3 corrects a error in an error message that reported the
wrong threshold register when a register read failed.

The first 2 patches are similar to recently submitted patches on
it's sister driver OPT4001 [1]. 

Patch 3 is specific to opt4060.

[1]: https://lore.kernel.org/all/20260714113134.3445-1-nikhilgtr@gmail.com/

Vidhu Sarwal (3):
  iio: light: opt4060: Reject integration times with a non-zero seconds
    part
  iio: light: opt4060: Fix pointer type passed to div_u64_rem()
  iio: light: opt4060: Fix incorrect register name in threshold read
    error message

 drivers/iio/light/opt4060.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.53.0

