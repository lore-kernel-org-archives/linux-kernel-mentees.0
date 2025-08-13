Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937CB2BD00E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069535; cv=none; b=S3egbdPplco41K5HcbkCjWT69Wcr88yHiuWS65swqymEvl5E1DO0jPnmOSaHiS2m57Lm8dNssB3j31N2jFzCbfvB0fYasQ8bB7EcX8tpTzYvTwJrG++qdSXdEBmXhHToXlacdOy3FRyYev1ch6+C+LkT//YP04Hn6iPZXiPrj3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069535; c=relaxed/simple;
	bh=8j2oxT6mk0yZmoWePt15+N5CrKZUEqAw4bGln0C329U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RN4W8klDS50CITMyCZrPvD680HIVzkx8a162nTjp69feM5+UNFuRLCqOXVIT7uBjfqejDihOw1PGkeKkAI/FNUrJvgDBpRNg0lPpSsRqLcH3l6kULlX0lb6Vhjp+HWzjTuCaemOb+bDC6K9L4MO5yM5FlViaPKH7mltBlfGgDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/guvnGT; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/guvnGT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDA36069B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 07:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXPITjB8gsos for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 07:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=karanja99erick@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19AE460645
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19AE460645
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T/guvnGT
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 19AE460645
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 07:18:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a12b3f4b3so10913875e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755069531; x=1755674331; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hT7zNC81MFnipI/Ag5QHfvvjbScQaZ5LLk5g2Y05B+0=;
        b=T/guvnGTStNwJ6OBIrX9pv+icFVPutNOF4QRTSrB8H02fBr/Qx3cVvpensJCLcDJDH
         F3MtwQPCcGEFTVtWnYZD4E3cHw7WrB8V9mIBSrLEmcUPsoGRPdyVRKhIYu3f6LJlYrS9
         EEIVB8GFlFA2JftU7lCZDDJJUXL7GzBIIrEOouYo/kDUYvnPLCi5hU2wWfs8Hzkl+2GQ
         qmeIEtXni83fWZaaJVZnd/8WGGtd1+gQnuCsTW/UQlmtDF/LoCYcUuAmt+lWCDkN2/UD
         VgdO7d0T3eonWQj1wSk+eG6pIKKrXkZWhjjfT7lkpQ/0QyqNBh7o6AshHnpH4GZOHudA
         U3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069531; x=1755674331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hT7zNC81MFnipI/Ag5QHfvvjbScQaZ5LLk5g2Y05B+0=;
        b=eWg4y9sxQeavz5TnfJFGqYlNZsCKsJwh9RlrXXSEjhGjILqB9rH6JUzJJVjpFMtbC4
         qD8oeVW3X5av509qkQQInng+bteA0mZXiucThgwBi8lAwtslvfJ7Vg3zVu5B4g7Q74uC
         vTCEPpONb2f0mA0xkK7+aF/xYiWRuljqaZ3Ywt865/sRfxu2Ug53/UKdr8ImLipoPtTE
         noSz9uA9++6zUL6HAuodxZKU2tHBT22BQ0t9sFqtXniP4b0BEfhKl68TzqM4vRjrXZ/V
         zno+8FCr/JD6DFRwp7FzOHKZ7jNEA3vAsrvh3yFesHlKz/ROBLsecJ1+tzx1E5GOm9Wb
         /KOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0onx9vEaMqc3ZRydksE1wXE4xYtn2aYnEuausu//gDeSdNftt3KloBCszd/O7BuHr0CmGVFMheo9laCY4FL9Sc+iRkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4mnvi31sav4AVRJHZqNIf45+tBM+5xGZ6jINCHuNnOW347pwW
	P5zkSwYfWfcaXk3bmyHEqKV+ksDCmxthiVv2+s8LwQcM5oDP7hJk0uJe
X-Gm-Gg: ASbGncuZR07g78OfE/ym0AxMqMPFXFpJL2tLgzVUoO6pmeynZGmvl5j0f4TlhWaEvtB
	yEgFDgszR6fvcmhGvcYBd5kem5GhCTRRnRdwthqja8uCUkBDy+2/PDkicFTTEHt9nFmlIQ0mYML
	D0WemLTKkwFTfSJbTFJZOAtaPwcG7cc0G6eL5cRq1YUX7UdAqQD1l085ZQ0iv8jcxyQkix5pQth
	crYJ4/JfUNT0Rg1DX+PLk4qHMlR0xSNasYM3YLUiK2ijg87ubOs3AfimU4jvQypd8PLmV7hzq51
	lfU4YikT0P7wMURi0C2pEligPE0peESRpV5pop0K87v4K+i5yxctm9rIifmuoqeYFK7GnehR6gc
	F/KicvmnOnYB88zW0Xow=
X-Google-Smtp-Source: AGHT+IEglHcl0W/BNit8lnQzWA48TYtNNYEYIowfu0Jp/7j5jJeKFCchpl/EObW5f9/xZRNrLK5j6g==
X-Received: by 2002:a05:600c:1d20:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45a165fbf95mr14268835e9.7.1755069530601;
        Wed, 13 Aug 2025 00:18:50 -0700 (PDT)
Received: from pc.. ([102.208.164.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16df1cf8sm16944565e9.24.2025.08.13.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:18:49 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Christoph Hellwig <hch@lst.de>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] Docs: admin-guide: Correct spelling mistake
Date: Wed, 13 Aug 2025 10:18:36 +0300
Message-ID: <20250813071837.668613-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake directoy to directory

Reported-by: codespell

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 Documentation/admin-guide/blockdev/zoned_loop.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..64dcfde7450a 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -79,7 +79,7 @@ zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
 conv_zones         Total number of conventioanl zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
-- 
2.43.0

