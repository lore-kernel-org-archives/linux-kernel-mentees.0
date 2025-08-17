Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD5154BF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755453049; cv=none; b=GJAURZggmbkcNY5iHQmywJYY12Y2hb/u65cQV+I38I7W+ok608U7U6zaUTGn9FUNGdVPZB6ke3Ttn69Me3G6RoMgqhuIvQ9l0DHP8lh05oYUeK2uFy3duVyAouNLxaxThP3lBSk4sGoU7RlkDF3NtsecI9bO0JoSs3ZnrvZ8phQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755453049; c=relaxed/simple;
	bh=kxPQgkJiRwpdamMhQNsqSB3KW+32Rbalfx4xy59hTTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjpIkODqo5ucDfhUVBYq/UvFYlzx2vW22DVKTSUfb47cnNayarWwtxV+oWcxKLT1/ick0gprERIr6xVRP2X7O2KoH3JswkmLTZ441N7Jh1rfNS6jAGgO/5/TYUcBtNVVJ+9UlGPHXfbm+QX5EURNJ8EfbKkIJpYeX60Q4rTV/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+dljg/4; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+dljg/4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3475C83EBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCPuCInont7z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F263833D3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F263833D3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a+dljg/4
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9F263833D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:50:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4717554c29so2225185a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755453047; x=1756057847; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWZaVseHO/HpQONflG4VKxSa+b3LTJhK7Ltl+j+pOUg=;
        b=a+dljg/4WND+fbAo3U4VdSNNBZOxDosqgrNGdnPvKDNQy6O8hhQBY2N27uEkIk2azv
         BAMIebqbgjzK5WosMxz+pun8XDkQygB3/V1+YTYqVTICoMyCfcDzM35ztBqqJt2HOle5
         ST46XW/NO3XJEAXDoD241JkaT0nsgW8C02vSHDubbxAFcrQA9XhqbrSjIeE0xpcz2VWz
         aDp9BZ1xncNaotrup4gkLLjRGJW/WhbYed7HIbJWBWl4xFbBZsisIuwBx4aLg6hGoE8f
         GvG1MR5Z4k9zSRgkiYiwsdJZOOoUd5hqy4ctnJz66eacFe6XhBQ4VxbkyyR7oXQBUOSY
         70aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755453047; x=1756057847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWZaVseHO/HpQONflG4VKxSa+b3LTJhK7Ltl+j+pOUg=;
        b=ttduFHDGTVv/Vk5ZZr2F7+9RLrKcb+S7xe837azLXcfVQdsEf3M0iwzkCPPsTYdDea
         yBpU38jHhkbyTLidVYSzjP+zSwIIuiKXSSytVfl4drvNA4tXO7WZNvRrzH+TgQsc9pNh
         Eny8Aa7K5jPrum2xHIKLtSd4eFGoG9es+5LSVDRj4TCcyGFo1fbBmDnxx4dk/LYTKSeK
         g7pPeywO79g4WSOc23bqEpNcZgbQb1qZJXa13O2oigD0ICdIKP6oAbHouHLD0HUCmHRa
         4xVXMiKwEN0z02Ss1XhNZGdMi4zp3qkI6JQt4ilQTsv2eZOGEZLA2//XUQrd4DlPtdbU
         SE3g==
X-Forwarded-Encrypted: i=1; AJvYcCXpdp/tNj5Xz+TOTqitdceDp+pjn6Lf5c1VfkNC08W3mPQNhRG0hB5Y6+98nrtxp0aGGfh7KESdMFaxfdCPQZCLbGu2nw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyXQJHxhd3piiyqrSoiZ6z0yAU3TIBiqa8I8n0QHGc7zYaHa4LT
	MyZJAA94FKzWZgKXbeAcGmAxLuLLGcR/wclWFA6/zd1Y/B52fsp9drSJ
X-Gm-Gg: ASbGncvQFjmIS5/6JIli+4SgfXNSy/Y5hXHlhvd1GaQt8nYfY8nOF/S6ipBS5T7KCvM
	vxTc8ejWyfaTIeM5ZslC4U4bB2bl6zM9aGw9KYK7d6f05EUJJWgVqcl2DJDR7FvOuZbFm54guUa
	f45Z3Tg5+Dhv6iaDIJ017UFcwjkGFXV+wHFzvKsDkCVq+bDyhUgv6HIo9FzFxkPlW1gWgNYD2/F
	cgQjSvHIa0v9q5VCVhfzAgwyJYXdmSR/Hwn5qOtOOtbeDO8PMRVu+Hn5qVcbI5qjBi0X52FpMCh
	eRBDfiuqwyKHyuiBVuNij0JHvENShgaGplfVwUrR3ZEoG/LQGewjgKqcu06bhSUAw3xSRARVibA
	9SKYycuMOm2XYEfnZlSxVKg1wF70TOuvZb8OoeugY
X-Google-Smtp-Source: AGHT+IGZ24e0gHA+JVsQY6YX2jt/f72OrzDBs2UDcSTBqyD5prVbXpazBufiCCm5Zs5j+Xpo9qIt6Q==
X-Received: by 2002:a17:90b:3c42:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-3234215b3eamr13428682a91.28.1755453046625;
        Sun, 17 Aug 2025 10:50:46 -0700 (PDT)
Received: from lkmp.. ([157.51.85.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d799c8csm6243856a12.55.2025.08.17.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:50:45 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: gourry@gourry.net
Cc: alison.schofield@intel.com,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	ira.weiny@intel.com,
	jonathan.cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	vishal.l.verma@intel.com
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
Date: Sun, 17 Aug 2025 23:20:35 +0530
Message-ID: <20250817175036.6906-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aKILiuYaijqAZvPR@fedora>
References: <aKILiuYaijqAZvPR@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ok, Gregory. 

I will send v2 without page-allocator changes as suggested. 
