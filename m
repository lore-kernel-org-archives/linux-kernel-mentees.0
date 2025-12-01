Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4F2882A7
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621467; cv=none; b=C13AIaMJSe+VMKHGgq7nxnuqqXiswBnwC8PdpyzdxyqT34liHTOlQrSUDTv7VLCvr0G3BVsOGt6D9sPevge0UVIS8/4vfzQh8yDwaIeQLl7topqSwzjM4QdCfWFz0re4lRGX49Ck6CI+/5yZ3YkxJfEAkCTThQ4l5wStXm2df+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621467; c=relaxed/simple;
	bh=+z7MJUYb60LpP3DCrX45OA1BaY4HMzD8WKTvs9ZysQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfmnhRUjUEbyPmMJ4SIYd7hYTYZHnn1TmXk0UCgr6ePjeLw0xR/gq34Q8DEjNV4GrGpPRUT/wByfcFz48VlOUwJUL9JG2mfbzQ/Fu/JWx5kGbPn5PlYUnZEwwzYmDjE3jbsuWAFJ+SRb7NzlQnvBJSL5DsNEnhu5ZG6Fw8xjlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAEGzScN; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAEGzScN"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aad4823079so4086078b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621465; x=1765226265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gma2nwegmLLD/sSpOFo/G4SpxpRQHV3w21+ECcPjv/8=;
        b=BAEGzScN/MPXPrOXJAvAbc9T4rDB3ew8RPisRYQEgIAwAIUGAM2c36oSHr+6ZEtCdC
         P0T84nYimLVPT5205l67zjxkJwyWbboDEZ+K6TwNdntU6jCYbFt4Ms/qFbrPhXRiUeG9
         nN7LPKpvGn6kq07jekSCws2ak0bWMIvl+3J98qAwsEBas2Gxscql2dh0vTW32giU+fnU
         9SnS+ekQxQX/lmWhhReL3Bz2+PqfxHT9HmIpkA+jaHAlwS+sECMwkgBvQu8MNiCfYd/O
         ixYH5pOMZfjTpwklfbW6Hy12Ql1j2nQ3WiH3t1aHFsd8NMpykPLWHwX5Tm5me5wWl57D
         qRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621465; x=1765226265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gma2nwegmLLD/sSpOFo/G4SpxpRQHV3w21+ECcPjv/8=;
        b=tAgfb9OVp3qnNd5thumf4NX0Iry3XkkK412D0FP1uOzRu+ZheyejETsUtBQYk5KFIs
         0hlMACoWRUPU83RJ/ZWQqMs8dFIUmT95OJvNcwSylkwuDY3gNLMrPAFLtW4scdh6O9ZA
         vB113wYGC+I9plCXaIFIKpre+kkILNr5RxyexrJV5E5ohmxgf/uP0v/k4xxJKe2raPZB
         lQcZADDlt9IqPxd5SFoy7j3cR7CEvk8FqD6+juhIZdv2Qg7xxzrPh2bidDphvhejoam4
         GyX3ZcZI0AAMzoUYXwn2dn1b5RDjoVnhAYTfo4yeUxknezuONQdm8XdEwBM5hwByGjqi
         cjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrvzfjn0xIh0Rtyr4PnXBW7oP3fqE+Wy8COgjscHDh1Hi+/BddAKv0+JA4Nxq/JgdpRm9as1fRmzEUfp1sd4egwYF7jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDEBhiI6t1mLxqNr2yUGhkEJ6ymNqXY5RfpuwTTvrbnfKUEM3f
	eofH1EpD8Zcvtp3CP9+FxOYtbeMuHdRHyPBFdyKO/hwnCIUJHXuZ9K0u
X-Gm-Gg: ASbGnctcTNtK7ZHgNv0cMZ/BVTsUptuJIJl5sydpcvE8kBOgjdJmSYXEq+bpYC2zA6+
	EzTKH5GU915JI4/oJPNqwpFkAUD0pauQV8RUg6f/lb5ziwdYonc2/6kJeVUU0fjwXhEZmJ4kUaa
	ke/eXU+Ivt+9ZAAG0nB3Vp6O6h+oKmwljXLTIqWhfuscvhmrSnGgDY/DFxjpqdfF+XOv6BvTikj
	icDJj7FDZIn7WEGF9MX+IaMrvLB8ijG/SR+1ZjsHzmoj1QPQ3gOMR4ypHnPfTQmhurQOI+8WjB0
	qyD4sXFA2tm2MJCUG2FDDppawlnJDhDQ413+1I8o9BRBiLZJFCDInYXKctCOkqHHfjmmKf+JZ+a
	Hnm+lEEjCjeqS9PzRSExZUfwQMwZxIPFgiTWT4WTrTeCRGh70VbrNZzwBsf1jjJnJz/VqxzQV+h
	TyXfU2HUpr+/1GCmGG2fpqLTMH1aWyIUUTo24=
X-Google-Smtp-Source: AGHT+IEv6qggrkagHbHFmeDaBh6PQo2B1iDXMGqdGjyVpT30HqcEFvZQJvlPoYcmGYPdnYgzjepe8Q==
X-Received: by 2002:a05:6a20:3d85:b0:341:6c8a:5218 with SMTP id adf61e73a8af0-36150f3539bmr46099057637.56.1764621465159;
        Mon, 01 Dec 2025 12:37:45 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:44 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 5/6] usb: gadget: dummy_hcd: remove unnecessary parentheses
Date: Tue,  2 Dec 2025 02:07:14 +0530
Message-ID: <20251201203715.17768-6-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the extra parentheses around the if-statement conditions to make
the code more readable.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index cbf9dbf2a..67b453620 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1407,7 +1407,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		int		rescan = 0;
 
 		if (dummy_ep_stream_en(dum_hcd, urb)) {
-			if ((urb->stream_id != req->req.stream_id))
+			if (urb->stream_id != req->req.stream_id)
 				continue;
 		}
 
-- 
2.43.0

