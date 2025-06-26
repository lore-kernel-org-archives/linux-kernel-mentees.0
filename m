Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2624E4C6
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973537; cv=none; b=oxhaw6i2kFpX7Xh3hth7nHT7VMTxznbrSOhqRnuGu6U3JrVzvtW0SWVjxUz6DolZJgIcpLRpzVTmPFHnbKvoDBDJVgVIVTUSj85yBR9LnOP/a4EeOEmH/x6p1WhW8iGbw/vqeDLAyMhYYYgfrf6zb+pCE0L+LLvDRpCpqbTkx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973537; c=relaxed/simple;
	bh=Vg+bsnBCAYgGaA8Ef8XIx7/sg+GRsIjqsHyzMhcM+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMM3TycK/lAxLJCopZzLi+/QMbmujd7h2tWN1A0UvAy4khOstbm45K0r9ytFLxQSNlvW68ZvElgUmvyzX+KJ2hSD60AkOwiZzeg0bLpGemH5Z/UbZCory2q2OyEaPlwjigcUJbv5pdLq7o301r4HzJrk3NraOKL6qCrJhK+MhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYXfHxlg; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYXfHxlg"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2efc0ed41efso538106fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750973535; x=1751578335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=JYXfHxlg9TheA/oHNYesNZVR8xiIw7tbsblvLi4dPFyL6uXTr3NC5Spq/DSFPLVIBn
         a8rfGHRA3RaiU4UrWW+Q+4syMIJLW/5URFQCiZG8fSWHIAmzr9pk6Q6AF10kIIDhZrIA
         /IQ9OEs+/Vm1d5unvcliZ6oano+WfR57TbR5Fn2L4kLzB2XlZzh+yE70yicIIGrtKrSC
         9uD+wEv96omQEPy+5J44FaYhp3P1t3vzHyAnOC4ADPneTwW0XbGeG3cWUWxPOGyPc3yF
         6CWhDv+DBj+io3tyiOHcirEppC+TmQKz6O2eHe3gljVrxuvMu69S8wmIalFK9P8iOJHR
         Y0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973535; x=1751578335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw6mnndRYOAvK0RCLzt9VBUYGf36cfO8dHKbt/kftME=;
        b=UaYnyQQu5OMc1UZSpaxcyP6/K12ppM7FBogskd+PS/otccSJfFuKMNs9LezU2/TKnj
         rGDSWyMXV0YpK2+WQjyWT7GXv5JyE4jOue5mcJO5p3JwAJNVWcf9U4PxkJ31CHYfIui+
         q9vFqJgbDxXL1wY69/heOou7OeIs7KIkBeKjaWSvAfVyg/rZE1pn/IojYE+RTk5m6YZi
         gsKqhSRQVvWvjCWzr/9P7efs+nZKQicNpc5rxEFkCGf4Yt45ptqOFQVLhrrZdU0IU3wG
         5cwp5qkjhmQlOX6BbyLp1QG63AJc5Jp9DjfLGrZhZNwmyde01D8PLYGZvNEBMMUVe6h8
         K+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC4De7RMV1RUEg/IlKQsaVWef3ts7zJU9Z96I8Mq0uL9wKynqIHlicw88hp3aYBs6eZD+es6z49hJKdIUYVrM/22CqlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnCFk62vUZNA192fRTPG3ElkKLV10qrFF9YNjdnP+v8+TIF83X
	AMu/jXDgsesf3DsKbdXegl/uGRqBYljGjHpA9CeGal+IpK9hl/dWq8zfOe1EuGN4QUk=
X-Gm-Gg: ASbGncvfpBUVLcSY5NRz8pJJX6oBTEldU2rDecUkEcxRi80hZ2dfgzJJkTvKnQEkqpZ
	oqVxmyLdzj04E/oFIvKpRdPwnzaX74eVttMhLFnS0+aEidWvlbMYUJghLlbIYgca/AkMbYiDHXk
	gT4W68mhjV0Llm/F9qejVXw1/cVJXFWm/tsj4z+T6B7iMcO392DsRCOgNC9HjI0qrh7GR0cdq59
	qSdwCRMsfMo5R1m1zJRvaVRX77IbvQGCxkdxhVUPsen075XHRy13kTmfJ382hyRvQ+eoRipsfx1
	jySS+ft8c1nWbD1NaO7Xhv/mKSYcPKavEMSKt+wo2veza7rJ9PHPzm6DqwXmYuYA45NC
X-Google-Smtp-Source: AGHT+IH2nzUMv//M5Dg3a808pERB9UcVAPf9zLq+udw6Z4J+VVriEvR2PRmVpGe3ReP9rQZlc72UBg==
X-Received: by 2002:a05:6870:b488:b0:2ea:1e5d:8ad3 with SMTP id 586e51a60fabf-2efed6782cbmr417990fac.22.1750973534993;
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd512f0cdsm547789fac.46.2025.06.26.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:32:14 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain>
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>

Resend this patch with the changes Andy asked for and I'll Ack it.

The other things we discussed can be done separately.  It's also fine
to never do them.  I'm not your boss.  ;)

regards,
dan carpenter

