Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C5364E9B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557745; cv=none; b=dK4PQXiC1e+e2/i2suEPs6jEmwuGIb3qKb0DwYguyNRS95w7REv2kqFCm+jnD9+f13IUTVeeEaXaD5H44i9N7LM9ysKa//J7dQTFKk6luSFVN25PR5rQwA5W2+k078EKLamFRMhmz0alkOk1H4ZrdWgFI0T5r+0A/KDB2CudFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557745; c=relaxed/simple;
	bh=Ov1DO0gEROAmZbORgQvXasiNjE3BiOD+UMuymUYTkjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHNdDfRRK+j06FIY3lT8POEqjjAJ6JH6YrRJRA+aZrYx+BQvJeBjqpuon8EigPhudCKmgHsmRb88ZRUuBHqpZ0BqHu8RkWT71vrbjpbyOmMsiC40HidPlcXSoQXKY06ZbvKP3ztWCN+yuMY6Z+VudUCBSMV9O6IMQRgCqEOoR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsijdluX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsijdluX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso785485b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557743; x=1764162543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PhfpThnBPbWYm99SayqqOmvAer1zIz//ZVr6sgUx8g=;
        b=XsijdluXHqoykg0p9wHFkWf/3eyUdP66OKkZmegvb+3dDVXDsHgqRW+CISQ1LJe9hu
         0LSnxDTjcHTEqM5ozs8sOjebFYxU0KJg2SlegjGxVyPy8YwSmwYYzAOpVnpxLy+pl4Bq
         8k6w0wFthB22MtfPjySHnWNBH18JXlWBgG0EMT0nmZ+3lOI5M5L8BDSEKcVbsGqoOTFa
         m7ugUm/gpsUthbYmYpWxMHwTWWXfu/kfmMKbziWwtvcwNN25ogs7jw6lx+LJ6zAejfT0
         Q3J0aLx+U5tYvjq9E4fWqb/ScBRFchW+1MTUd9eNDcA+JQPX9vUx+QwNARByNaO7CTou
         U6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557743; x=1764162543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PhfpThnBPbWYm99SayqqOmvAer1zIz//ZVr6sgUx8g=;
        b=dytDB/tHPzhllE02umLtMsa4UIM9DEonxJuhA/VZRILRAir7uqKiYhVPHWYjGI9Yl3
         Qnu+jNXU8nR1kj1n+cgxwEc2r6PVu+zuWhMDIYEy2O0DAj6OCGPzJZ+Yy7PWyJNERRsU
         2hpMm5pjsT7pXq7/4Ry4GnDZoCY+i7tO5RY77gI1OQT7n3nK456wPnbNyF6IcD35gyxm
         cZCEouG4RGipkwXe3wGKb2LMvsZl0zHeQd84lVBnrrnkhrSaY14TWLBvjL2/XFnoKXqQ
         Lqa4Kowx+0d5QaiTwvV/Wkuq4Oebm4L4aqJMpE50Y8ejR2lvcz7mYm1bAcpG+pcjVKV6
         U/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVJSY2glJlshYJzXW8NK8eQZ7yJHEnpiP011aqPUT17ozn4W2p9IMGtVbsBfzWqQZ+fcumO3/NrWbHj7rD0I5lFqqUqWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Lls7xVQc5NDLHJAIKox0JCoIdIsHV2rRINkoPGDKPn4MYvrj
	yahxAoWXHBBazkGBlqHxZuHubd/kYz8go2F/eqGb82XgpxTz2XXKWDDV
X-Gm-Gg: ASbGncsqL8yCKBL6y9/620H5Cb7KYl8t783C5NLg6V/c8D3En5pnj+ulDNuNnrcPHfV
	nMQeQO+fp+IoCyo+C/HHJaCrrIiGjsGkVpViNCwSuOpC50V+6/5t2IRdqVqB8oTfy+/UOVAStqN
	eu0UPPld0n2aKKyCrLah5w3q/1XnK3OW5r/3j/822x9UQXjUf8Etgwk/Kmm9v7oTwH85GG+ad6+
	FxodD3N7HC4rrCh26SHBc7HlJ06c3dCUEhsM7sh4iKG8yN26oIlmu+hAYObiLl1ipSf4890TOl0
	ys/EaW7aeswDBIxL6t+j4Z73RA63wL+3fOrkCp5RKoK89o8iXQwTU1X2P580pH0mdLu3MdVdeGT
	uCUTLo3COsqt5OTpXPOrI2S8+q9k2Xsry221osVOGcpeYZqU7V+wYQCY6Pkfe4i7RMjtn4qtEVs
	pk8D6gQWEy/TChaKZq50KfkyR0hzoL2JzNbTgdk7ea5r7esA==
X-Google-Smtp-Source: AGHT+IH2icsuZup0t28zq1+gCeYw7a1CehWBpfDeeE9rZAiWffx4jMLQwXpNwKhhHe3WGMo/AhuUMQ==
X-Received: by 2002:a05:6a00:4601:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7c2c0f5719amr2777639b3a.1.1763557742964;
        Wed, 19 Nov 2025 05:09:02 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:02 -0800 (PST)
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
Subject: [PATCH 3/8] usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
Date: Wed, 19 Nov 2025 18:38:35 +0530
Message-ID: <20251119130840.14309-4-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'unsigned int' instead of 'unsigned' wherever possible to maintain
consistency with the kernel coding style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1369b9613..6ad366640 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -506,7 +506,7 @@ static int dummy_enable(struct usb_ep *_ep,
 	struct dummy		*dum;
 	struct dummy_hcd	*dum_hcd;
 	struct dummy_ep		*ep;
-	unsigned		max;
+	unsigned int		max;
 	int			retval;
 
 	ep = usb_ep_to_dummy_ep(_ep);
@@ -1414,7 +1414,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 top:
 	/* if there's no request queued, the device is NAKing; return */
 	list_for_each_entry(req, &ep->queue, queue) {
-		unsigned	host_len, dev_len, len;
+		unsigned int	host_len, dev_len, len;
 		int		is_short, to_host;
 		int		rescan = 0;
 
@@ -1443,7 +1443,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 			/* not enough bandwidth left? */
 			if (limit < ep->ep.maxpacket && limit < len)
 				break;
-			len = min_t(unsigned, len, limit);
+			len = min_t(unsigned int, len, limit);
 			if (len == 0)
 				break;
 
@@ -1624,8 +1624,8 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 	struct dummy_ep		*ep2;
 	struct dummy		*dum = dum_hcd->dum;
 	int			ret_val = 1;
-	unsigned	w_index;
-	unsigned	w_value;
+	unsigned int	w_index;
+	unsigned int	w_value;
 
 	w_index = le16_to_cpu(setup->wIndex);
 	w_value = le16_to_cpu(setup->wValue);
-- 
2.43.0

