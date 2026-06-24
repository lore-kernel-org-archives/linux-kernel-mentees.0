Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C72C11F3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301612; cv=none; b=MTw/Mbi9qznBZ07B971PFyHlqQIUvJiOIDUpiJYHet9N4tiNIMsnKYayNI3gDs2kdN6pKfJ5AgsHwtyMM06HBkdoROEapBxXK46iz8l1Brh73FYRk2sGxnJDsa3YwjZqlghwUicY9cydpuAigkJ58c86/6l4np/Z5wlj2bJ0/eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301612; c=relaxed/simple;
	bh=hUG3sRV5RMfHn1ZN0bBsvFTkVjqprDKCzLA//HYhC5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9yUbsvL9bNVFOhdk4ocN7DSlmrSbdD5WQSc0jGgYBVTsZpJIBZoANQXP6DZMrlknefEJSiUNhOvC2oEQDoWRur5SJ5iv0L6+D0vY/urQS9wbrk5reMwfsF1KTCjCwui2VLRJAdyfw2+I0eTkzk8KvA3LPNbp458ElnLpYkHr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtT5EyHt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtT5EyHt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fe59255beso508006f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782301609; x=1782906409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3H5kDynZSbAePBxuJSQkwuSXPVIrHP5CTV7ASDH3eLk=;
        b=rtT5EyHtg5E4owpW6mfs2aJB/zDixofapOTIxek0UoCbsdNEisHQSyW35rQkr9IpJ5
         FDbIrDAY3X89sp5soRq7S52cZxdPBQZojI9xwOv83Yq/SoarzWnbL2BtAA1DwSA9+46e
         jQOwUX+UyCe9i4vITeC/OwenmhBiUa2ZDVH6gEoUWM8BHmgrei1v3/Uc7EpGQ0nEYia1
         pbcvE101LrwXYWGJU3mIB4ug+n3L5wuk6e/NMpl3dnEs2d90RC9OYmasByseYl2ozNQB
         xb0D987VXGaQib+uEHAO+fcTHgzLorCo2nEomb0gdhNI4YY3ADVZdXYjxHgkRt47iD/X
         hJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301609; x=1782906409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H5kDynZSbAePBxuJSQkwuSXPVIrHP5CTV7ASDH3eLk=;
        b=hIPeauE2U0SkCQY2MWJf1nUpyDIhOcY7Im05AG5qWQAuMmba9tfR9C+nqJdCTmbCQa
         ArO5KRErprPSWB6qhSvahdJ7Lt7PzXbD+qLrfbxAp/4pMFZxNbW8u5+EJ/MiyxOFQOVf
         fJtgXbgFtAYMM4WIxBblKTaUWjEvgG88sDtxPMwpvKeF43QBVllj6DYyiCb9T47iOOZF
         Day/DOkfb7AEj25pk8t948o8b1LAAvBkbxGQCGo3VKzWiYPcMmj0CgE0F+YfXo12k46g
         DTG5SPyk6IxJHMyiafxb7F3m2SgwbCvHw+SrNPHUkJwL5KvdMFffHPuOvWSydypqwlAW
         DkSg==
X-Forwarded-Encrypted: i=1; AHgh+RoXl0QAhHWfs31V5Y9a/+5VmlRKLbJnNY0LUj9x8XjqMF9PIijdvjqKpEC24FmToAv9CAoxOuwPd8pigvr1qWn0SgLbFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0LT9wFJVXFtC94qxYyyIzyZhAq2/bhfTIBh3SXy28d3xDuO2
	R2Q8u0rRsVagUSX/CgfAM5ZBneoC38Xp/VGWzvFBwzw3w4qAX2BxY4Q=
X-Gm-Gg: AfdE7ck2iG4gfO1kpedbBribtvRVI/WQKJAkiCKZZ9oFXkBpn02hUBLKQUgXvh3Fy0z
	fSfmMpqMcv3jOaDeAYe4GTKtIWLZXW1YMqgdHJuGmCpQavbpGigMrCNY+YJdR4k5xy9iJIRk97R
	ydvc0rn/V+vt7cnoGtqOoRTkyTsM+/OqzjTR7eiQHppi2poVYDGkOWRV6SzIjDuBbnqXaC8y7xW
	iLZ/5ixLAB5hqr4ZjuiEV523nlmR9xDQVoye2wFvbdgXJi/KaZs0Xh05g9Un9Jo7uRapHQe1N4N
	lyOJzvHNFN89lfJhKNietWL2GYXPgOE/EgsR+sNqXmmrZ7dr3zjQKnli1yD/KUhps8cTJ1T8NCR
	FnZbOfjXCLqfwAlMiJo5gVdmf4zH7yZJI4CGlLb0Xqcfq81+2FGiUMcrfB68cEdQqa1ijfjJsCE
	P/s94mLauVKM/gH8EZV10oTB0QNXNMDUIIt0TcSfQ8FMOwzD78OW/wBzuxmqfI66HBp0v4CYBDP
	yYs1yETbg7Db0CnDnYvlA5uQy/27/m3NMbD+4y4
X-Received: by 2002:a05:6000:29d0:b0:462:d07e:4bc4 with SMTP id ffacd0b85a97d-46ad8a3a16fmr8045661f8f.7.1782301608585;
        Wed, 24 Jun 2026 04:46:48 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-0.broadband.mtnet.hr. [92.242.248.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm6396036f8f.9.2026.06.24.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:46:47 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] usb: dwc3: fix kernel-doc string in struct dwc3_ep
Date: Wed, 24 Jun 2026 13:46:15 +0200
Message-ID: <20260624114615.18593-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation currently with make htmldocs gives the
following errors:

  WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
  WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'

This is because the member variable regs of the struct dwc3_ep was
removed in a previous patch. Remove regs from the kernel-doc
string, fixing the warning.

Fixes: abdd1eef04f0cb3b ("usb: dwc3: Remove of dep->regs")
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..034e8d7717e1 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -722,7 +722,6 @@ struct dwc3_event_buffer {
  * @cancelled_list: list of cancelled requests for this endpoint
  * @pending_list: list of pending requests for this endpoint
  * @started_list: list of started requests on this endpoint
- * @regs: pointer to first endpoint register
  * @trb_pool: array of transaction buffers
  * @trb_pool_dma: dma address of @trb_pool
  * @trb_enqueue: enqueue 'pointer' into TRB array
-- 
2.54.0

