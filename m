Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079833C9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243331; cv=none; b=lzIrYu0HlILD0jGPeMD+vEiqY8SHqMHKD1YvxkUm5ed+oq/SMhK301OkIM6ZgdXqS8u8gdgJYv6r7eaB+R/cr/f3rQZN1kB/PSsjYwDor+ZeFisfcSp4vMx0pOgd2mqBOpLe78CyV5z/juXwMszoY9jfutjpineX+M5XwdGd6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243331; c=relaxed/simple;
	bh=7WfjRqak32dmDEcbYuCM3PkVd+8nEMKIrPGztxIZIfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Giw5urlTY1jDLun46LFyvSJCMsD5+FBe7UNad661A6NVUbrC/2KwD/oNR0eO7mXWTr674eegqI1F16RyH3OBm6fEdwE/ikDx2D+nX/bpwyH4BkRqU0/4YuyU7gcP9PRN6g0AB57lrmQ92DhvOs27Nr2mdJtPWNOAIaPXpxgogu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfTop8Yv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfTop8Yv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c336fcdaaso43111645ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745243329; x=1745848129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VILm46anXu51tGkwwdzpRRF6UX5t99Pkc+Jaul39Ijc=;
        b=kfTop8YvvzQ9MrShirVXZH+w3a1mndnbWfBqM6orYpQHp2lgqA3y1zALKYLx2U5fe/
         TObR32e0XsU5Nn+x0PitCtHnE36Mvi0BC/Z0aLA3+TZ6kG8FUdtqov1rt2lMvbJF0Rhe
         2iQbApzX6oKvSCn++afKyiGz6geKwFz0esLO7LO2IPkToNWc64dVgPsr4+oJzHGDNP3l
         7TSyaXmCRfB4O7tl99dRCE69o3QZ0t34psYz3wPFnnMCaOfAxZQ5QbfUFrT6cmu8wOQG
         TguO2eU/N5MVAuA8xPsnfg1xMg6Yf9Bl3uIFJ7ZaX73k44Vb4AGtG7rl/A99Z2eVJPzL
         7dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243329; x=1745848129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VILm46anXu51tGkwwdzpRRF6UX5t99Pkc+Jaul39Ijc=;
        b=MvXGA6ECkTsnY7K1KPj6MpVLoQTeDno3J6yXG4ZiBssB4dqZPLMxe3jWJp/Eqb3LfM
         MPSBHaKp4xjUXi20Hr5oZlgfG4ouBDz4PvzN6Wr8wzfYTS7LbRyv7trOavr9PWgXUH3d
         NkXzNTVap9DaxBpUH9O5Od973jdo5bWfEnVakkEoK5bAus+O8XuXCmVbEUMwGxyNnRFd
         vntwFpD0iKeN6MZoQRVV91MGjY/zdzUlrF6r1+WCMUOkk/DQZwez+fOP5I6xCOthTavO
         ldDlwtTW0AY0tHgc59ZtU1tJvMHx0mcsJpvLGoAU7VJeYa8HiWnxLQTFZQhUkaD34CqY
         Gssw==
X-Forwarded-Encrypted: i=1; AJvYcCWCYZz3TFetFno/wDQHtx77c1LALzx1zSlI0PHpMj5ujUELk9s9YOdMRShuEN6B5r4ANvDOO1h464wJTujZ/VQiRew77Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAG0S8GDIgTJLnNi5KrPX6pYsWpX4eBaQLPuBqpfJU8GJZrMvf
	ArPlfaC+MJGQZ9i8DUoitB3K8dbt55l7UubR7Ssjzgl5lgjLAWGE
X-Gm-Gg: ASbGncuezWnTDEEd8EicA8yZ3v5uBOPQoaNvpHupbUy5bAb/iLOEsZ69PXhbAU2TtBl
	D3pA6VlkwGB//UQbykGtxMYPgQPan4J+E+r0HLhRUbw35UUOhqnZTk+3s+cOGXLAXtt7E29SFbo
	tH7QMgsqGzpgyAFSQd7CjU8BKlttKltlG/bVJIUdySuh4Ds/HglQZ1ZepF8qi9prIUkb0JxBFOU
	Uvfb1hVz/zdtjTTML8Fe2TN7JXVhUM+yMJJ5GVm/gDBO/kYbtwU42zvIs4l2WmrKhgNAi+JKXfP
	YGxrA5sNkVlNYAQRRSiD8DUoRftJx2ExzCS9wTblQT/6l+U=
X-Google-Smtp-Source: AGHT+IHWwCFSBtPYz/rqMUA+PmYcUjxPaIqEwBB5byOOqR1qNz8CJ2ovyvr/GGFQLmKtlFDzEUz79A==
X-Received: by 2002:a17:903:1d0:b0:220:d257:cdbd with SMTP id d9443c01a7336-22c5363005emr177837095ad.48.1745243329119;
        Mon, 21 Apr 2025 06:48:49 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73dbfaab922sm6746978b3a.133.2025.04.21.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 06:48:48 -0700 (PDT)
Date: Mon, 21 Apr 2025 10:50:00 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
Message-ID: <aAZNCEUejrTgy_yZ@debian-BULLSEYE-live-builder-AMD64>
References: <20250421124915.32a18d36@jic23-huawei>
 <20250421131539.912966-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421131539.912966-1-gshahrouzi@gmail.com>

On 04/21, Gabriel Shahrouzi wrote:
> The inclinometer channels were previously defined with 14 realbits.
> However, the ADIS16201 datasheet states the resolution for these output
> channels is 12 bits (Page 14, text description; Page 15, table 7).
> 
> Correct the realbits value to 12 to accurately reflect the hardware.
> 
> Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
