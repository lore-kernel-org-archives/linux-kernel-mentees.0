Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64DB2135CD
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Apr 2025 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048140; cv=none; b=R1s57kgI/E+2pRMbi4uGgJC2O5RAn+eBGKgYpw9ogeCgx794hm68Ne+s0szZe2w29TVurA5BKEnbk+10kDGxMxPjzLikMjDlcYXKozfpwZDWVra0fZmDT5NW+D7OMWpZ9RrWGmN7H5It47LdTee+frWibFmHPdL1KVKT8Yuw1tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048140; c=relaxed/simple;
	bh=1gV5wKAYIhcXsVsHpfR7Ix1lNB5pYJFNOM8j3/zUsXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hL5ouuYnwR4BQrLzbLpfY7l5B16PnPZ+oXId9/T64nFcoS6Wx6RDEoED2A1QHvwtWWH3YqnltfHSK2SNelQNATCrRp+JrJXUyfryHxL5p/7JXceV5wJBXf+kuN+9kqxZUFPZCOL89xEt6wBUNsJbS0b8w19j3wcec+w4oeWT62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK5jQOJh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK5jQOJh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2929128f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Apr 2025 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744048137; x=1744652937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gV5wKAYIhcXsVsHpfR7Ix1lNB5pYJFNOM8j3/zUsXk=;
        b=kK5jQOJhGOTo24xo+VuIi+lP4149bx//vbzjTxioTu8RHx+Mpb8LgsBPA8gv4u1u0r
         t/Iux+hTyzeFESvqM0IkTVXU+l7Qez4jCuZUWQ7HUZRpsyyxNJuIOGaFT0x9TNmMDaE6
         TudF7QztTNip4qL/65ZN89vuAslw4bkru2JQDJ6IgaAQYiybygAF4CszVKaZRX8fFOPI
         RsPKE9NLvccc+s12uWcjWNG4GtlcroyiaFyyEJGCzlkdL+Ta0SS+BjfZUiq1zBgKjwSI
         1cyr4EzYz+e1IYVDD4MeDpXyFz3xPRnAsAjP1zMM+jVATVsVqR1k2hlvO+QqsOQB6iRT
         EEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744048137; x=1744652937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gV5wKAYIhcXsVsHpfR7Ix1lNB5pYJFNOM8j3/zUsXk=;
        b=IkqV8Ssj7w1NTwlDJeTq7YGgwT3GAyzmtMivZWgdMJuJ3YJIFkIeXWgF5MYr269Wci
         2lB9k5chOii0xGkN9ol/p7OYHk4Rq2n9cK3KpuoPYSxfvkBZaAxliQYFoXh93m6dWhpW
         K7eoGMN7+0OrE7QKRIo7VYvyc50FdV17LmSN7iM8Ycg1daQGw4ZZL8RXhJexb/1cqMIz
         jtwjRkUhu4XtwqEcHzLQJnIkMyiBFstHO17rsLaoGvMbREA0Ko7HxhH7IbLWcLiMF1EJ
         tOf+3XS/C2lgYHRVQE50hFtdG/f48znCQUnkFgKBjSTbCk25OeJ7/AbefUMTmeHMSZNn
         VyIg==
X-Forwarded-Encrypted: i=1; AJvYcCX/eVsmh2hisYKlpjgrI/I2T5Qsl63i0BW5vrWukNuHoaNoFxtM9TjpFChSdYeRTpP/3cT+cHHLp7cRslDyn7lUGrBMaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqaWsgEYLEZp6xTS9EG4ZiUhTeuWWFYVpuQ878JKwC2hVmvAFr
	ZHDnJCurqgplIkM1102wAs8NTY1MP/YqjrB/JHPjv+XxOx6Vopcg
X-Gm-Gg: ASbGncuequ4v4TdebnXpGc6glcg1C+aWcmnUd9qxjVJ7Qq6yChM8Hb3J5fGtTii8OR7
	icFoYJ+ZlHNBrG7sN4FTLoMHwqDKOFETM+7kwVq0hZVBWALiZUmz8YGifDXb9hTwnRY3MI7GLBg
	m2mWfy04B3iy/z/ykv4Xt5l2uU5d1XxzTUKTuVhWAnmUkf4Z2nBLAaKcbsV+gtaUUt86h+TALip
	Op3zUzpfRFwdJZals44lw/g6IiiUJ+4857lIRyFOfkriWhHWvrxC1WFTgFwXvmP/9rPNdDwUnw5
	eAiBeMtGCiIMvoTvK9LoBDG59CRYV5aR0abHQkSmAKhcm9CyfP8pmW0fwH8=
X-Google-Smtp-Source: AGHT+IHvm5xHEyrihlXKOKxJKWZo3yYxmHfFKcTTI7HwXFFbKp/rPsqF3MudML2SiUaXd4RfJJ7FRg==
X-Received: by 2002:a05:6000:2512:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39cb35a73b2mr12028385f8f.26.1744048137095;
        Mon, 07 Apr 2025 10:48:57 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm12888149f8f.32.2025.04.07.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 10:48:56 -0700 (PDT)
From: Baris Can Goral <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] scsi: target: transform strncpy into strscpy
Date: Mon,  7 Apr 2025 20:48:54 +0300
Message-Id: <20250407174854.10132-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <D908SSFL0E9D.24WXC0I3O6AQB@bsdbackstore.eu>
References: <D908SSFL0E9D.24WXC0I3O6AQB@bsdbackstore.eu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Maurizio,

Unfourtunately, in version 6.14-rc2 (and also v6.14) strncpy is still there.

Best Regards,
Baris
