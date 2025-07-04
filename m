Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98F33DF
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594248; cv=none; b=WeXPlxPbwN5AEacwFY4oxi54CTRsv1xaa3/qRR8JFuGabLNXa+WKZv4+eegvHG8leZGABHiirNJm+08cuPGoKzuXJIRe1mJ2teN83QpmuXQuKWhXOnMZJI8C2CeII1RjCeMIHi3nlWsmwO6DH3v8PA6XP24gqsiijc1DsRFvbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594248; c=relaxed/simple;
	bh=OoCZq6LdsFnIFXOYI9tB7SS91E2B0eFrGNPYaxleC80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ffHiYO4pCCqMy0c9bTBZ8BfWmVzUtdXwfX0j/SHWXquee8sWFXgLEJUBVtcG9plycccCrChKy280yYjdbtvkHd50mWjqnM4BrSAsB+8/xP36QSF96iGf9c6S4ezdFlT3CYzKdHf50YRJTa55NPNSwAtBiVobehTCZ8nZ9vza4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=giNB8HqJ; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="giNB8HqJ"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86d0168616aso46301639f.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751594245; x=1752199045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcpGOYJoS+x1DjWEeDlJG5WLQCM2ycI6S4ggaBmrR7U=;
        b=giNB8HqJIqV5MuajqZw5YXXxX0TzJOblNhn+YM0ZYx1S/L+zQrELqAycSCmZus+LXB
         kIq0awQXZe04cLG+Ir4yLizlqg7coNqpY1jfL2svp07b5RQ+fi3b+HVl4ryR/3Pydy5d
         5xQ8+0DslaNQER23Aseu/pdzVGMGVahcIYe8OanMAg9+HQoethKYFQq68GLuyOLIvI3v
         WSBy1GsbV5Mo3k09yHNz/8Kj4tChLdFk2eT4Gbl+Cgj4OkZR0cxRBqi+zw2wdOXC0YIX
         dhoFQaZ6q43Ddpktwg39gHXMr4weL4LViGo+HzvOgI5bM4V2BJluv+GfBdt/PHbTVxlv
         O/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751594245; x=1752199045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcpGOYJoS+x1DjWEeDlJG5WLQCM2ycI6S4ggaBmrR7U=;
        b=fl21BrFVSJ44oLf/q6WlVEcqre0C5+GGR1RQ6ud/Qk1YspGSoD6nbSBDwHFqi1oaVg
         XzhPX3+u+lIKq3SBNL8jJjV9eg6zrEbK6jNXYahYcqPB+Ih4xGPSPGtaVBtN5sdduNam
         h3sENf4fI8CNRzjoip51h5kx3ubQqXoJx+LSiVPR/Zj31OFUb+BSRJNY9/V9Ta9qJOb4
         ZGWkjUGNryqgfUjG22h917slTZnJBAgNWB4YAsdcAYPBwu81XDFKevCnLJkFxz3PwS+e
         7G2R09P135BEKSsXBme6nGy01McCittiEzhfkzxOefm0DChbwa1j2BOSlESt55wVBJqo
         ylMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXEF+g2W6F1vt+KvtQGP0P4w9ox0W/OUevmd8P8OrfsLyJMBAKknsHxrDSBATzUU4S5icIePvMqtVbwoWgIw14fkIuNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd+cEi9l2lBItAYE+n86Cfu55UkXyKRHO5TV8PgnMiEP9tPjDW
	vTwMubxiDDOURAnsmHtL4NzgRq/x4ufSm+Wp5iMktprU89fGkwMLX5RivYUdCd9lDBU=
X-Gm-Gg: ASbGncssJRjHDqaIZwrylxrNY3ab4QolDnxfZmr2ZeZTfkVo2ynSQN2NKRPh5Q34wGM
	i0MVy4cHGtym9U4BQtdOJlNeCF4H+1iRSeGYYNydSS8cmV0/OBZXvtaiWeOiAzE6w3+gfkcVlQ6
	YOKPiQ0PQG+L01SSrGibMAEOrichxYeXdFGe5I0xbXluYXOzWaTRI4CtNHawylNkLBZmyzmc+DT
	wymuHdypxmCftLmQPlSqK+75nDaXSofFEAXTIh5wNa0v5HlQ7K3uK+QCXzEKtzMOEUwf8vPLT7J
	Gn9ABhKHYCg6YEOgwX4CcJfycwAOtwb8xdGQid4oM5FsJH7tUxCcjETHXn3MQYob
X-Google-Smtp-Source: AGHT+IGUGe/QPbULYs8yVIdrGcRGsydBwpQMFK+/9rqX/ujQ16crNXvpMjb/DcznQMGXzDKwDWM1cg==
X-Received: by 2002:a05:6602:29c6:b0:875:acf6:20f with SMTP id ca18e2360f4ac-876e490c7famr9887639f.10.1751594245338;
        Thu, 03 Jul 2025 18:57:25 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b5c38a6bsm218292173.120.2025.07.03.18.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:57:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: minchan@kernel.org, senozhatsky@chromium.org, 
 Rahul Kumar <rk0006818@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-Id: <175159424438.587194.16568667665048848339.b4-ty@kernel.dk>
Date: Thu, 03 Jul 2025 19:57:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Fri, 27 Jun 2025 09:22:56 +0530, Rahul Kumar wrote:
> Replace scnprintf() with sysfs_emit() or sysfs_emit_at() in sysfs
> *_show() functions in zram_drv.c to follow the kernel's guidelines
> from Documentation/filesystems/sysfs.rst.
> 
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.
> 
> [...]

Applied, thanks!

[1/1] block: zram: replace scnprintf() with sysfs_emit() in *_show() functions
      commit: 264a3fdab2365395e43d3a0b40162a29e61ffa22
[1/1] zram: pass buffer offset to zcomp_available_show()
      commit: e74a1c6a8e8af2422fce125c29b14f1d3fab5b5c

Best regards,
-- 
Jens Axboe



