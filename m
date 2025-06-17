Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40E21FF5E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161888; cv=none; b=rDoJ79rbw05JMoUPKSaP/oqHV+Sv1FzQ7qBQYRPHh58dzwDgy6aDQzVk9hDbZw6jlmiKW9vVHZIsnXlZj5FR9MubXZIcMKbQnCvqDql+ycvCjnM5v29g6f5m7sDnX9f037+9m6wsAahAE3SwgFsOrHNuoIjybohugP5DknZRFIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161888; c=relaxed/simple;
	bh=rfk7FiF0lOcK1XJobZRLILVg/IGnNJQDHCvjJMTre4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcOIG7EVcKYAmavAXJrTrWtzVKXIMfGRXo/am693c8NEOaJcfheqAAHk35qIxzzXCN1S67w+RvmbjHUHVwjtuq7E0uNZQPrIHJqk3gT/b5vv8IzMaRbuilceL91BzYxsgMpkApXuCpOg6H59nBoTO/xpfetOsnbFZ5x+Vdx1RI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1oBpS6F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1oBpS6F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a510432236so4091936f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750161885; x=1750766685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBHeAKw5ugZZFecnxceACnihCxbJc4Qc9dF4pQfrgXc=;
        b=V1oBpS6FPRtnoOYtnKth4cDu6yijjSIeNL+sUrOH8OKNYig/+SqiE7Y4313cDOYuxE
         pkZKLYFw9EZJQICsXUH/II5pO0Rjz6ONfd03zcdWvCvSVRZNbj57d2v5RlsFj3pUYyIv
         g7hHwDZdKebVSuOKF9c3X1fO3t8PpTlAS1N5ZILKRx5LoewQHZjFCLlzrROIukGFfTAq
         St1YzIn+zfW3PF7YQByAZOxQTynYpwxeR2Acv/gzPPvVrfMV9Hg7W4RX0HzjOZmm86td
         EH10JTklst4OTw7synXjNvmbfT2E5CUa4li02yHldKR7n+bUiIPovu4ID72UTSGND3Ih
         UXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750161885; x=1750766685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBHeAKw5ugZZFecnxceACnihCxbJc4Qc9dF4pQfrgXc=;
        b=AsWn/SMKi86kPJiTtUkjP17AmFp5RJ7eftdhbUr1DKX6jV7U19xSDSHT2mBTdoKLlz
         5NNgY++7RDfiHH5hhUGY08ti0EhYbtbEhMK0dF6NEiqpVcIkgGf1H2auUA+mhEvIei2w
         1r3AkQ1n3sBhoUpVAd78lMLwgCbYNOZB8qV6/P1a6MUS2hLS0F+18WjHgH8DZdu9WbpR
         sdFf7BPwjanIc4bxk05iEpZ2Yn/bfuUO3oQ+zNg+WhOZNdkqzqolI6hJVvNtX8/UTGk3
         VGvJt9TSPYknAwcXPPZpnNbDzhvJDtjahRKytE/HlCddIyF0zwWeiYnoK6L5SaXkk+Mj
         lu0A==
X-Forwarded-Encrypted: i=1; AJvYcCVaZdyz1tmzkXH/W9z9pZrhxLU7TDsrk51T7kk1mLHqQ0dPrSmHATRZ1iLamH9tZiMCqD4Krub+7CdOI24BFUWwqi4fjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YynwG1vnK0BZw0lpFm9/8Sc/zxiIbPZgugctK3p5c3+Z8lOITL/
	Hn9yIqJch6D3pqszUGYNJMThXW7orYZ0C2rQVuOHVALVOaGGZyAkGkXl
X-Gm-Gg: ASbGnct8reBAda+VGO3K+N9sa+RpQPEq7SM6kjA7rMEwg05eqFQ1AlIHthTj6eZ6TLH
	mPjkqlmAEGK0XtGDQ9Tf7rjjFl2uPo5k++a6bPY8NmeEMmAr62le88BtHQki44wXKFRCTn5HOdE
	gA4qqVhb5A9yBRuFEcX8bZVPCOD6hn3T2NeWIjHHWKJNa32e3ShJov6YqXeCguts8rhUXoIaQt/
	U+nqGrEEPXbo4G9tTnKB5bfAsUq3TreZIefEFP14DsquNTthiGq7YZOo21U7NIzUU5PPG5fwG2/
	YvONQYnZUJDZRH++QDVkT3+zvfSXsSvdZIarYLavGDoVSJ3Ooui/p5pjE5ig55nyfAf3kwYd2sg
	KVCyuMKrYBZaxgHxB3lb7FL7e
X-Google-Smtp-Source: AGHT+IGmVJOqVjr2VDFVGKHhn97Oi9W87DltDZ3k18EklWE4Qpu3vNOETU6VYKXRArKUhMPQLl1vTQ==
X-Received: by 2002:a05:6000:430c:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a572e6bc97mr11266548f8f.35.1750161884721;
        Tue, 17 Jun 2025 05:04:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60d0fsm13613548f8f.22.2025.06.17.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:04:44 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:04:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, kees@kernel.org,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] tty: replace capable() with file_ns_capable()
Message-ID: <20250617130431.50f761dc@pumpkin>
In-Reply-To: <20250607134114.21899-1-pranav.tyagi03@gmail.com>
References: <20250607134114.21899-1-pranav.tyagi03@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  7 Jun 2025 19:11:14 +0530
Pranav Tyagi <pranav.tyagi03@gmail.com> wrote:

> The TIOCCONS ioctl currently uses capable(CAP_SYS_ADMIN) to check for
> privileges, which validates the current task's credentials. Since this
> ioctl acts on an open file descriptor, the check should instead use the
> file opener's credentials.

Is that right?
A terminal will have been opened before the login sequence changed the user id.

The 'best practise' might be to check both!

	David

> 
> Replace capable() with file_ns_capable() to ensure the capability is
> checked against file->f_cred in the correct user namespace. This
> prevents unintended privilege escalation and aligns with best practices
> for secure ioctl implementations.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> Link: https://github.com/KSPP/linux/issues/156
> ---
>  drivers/tty/tty_io.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e2d92cf70eb7..ee0df35d65c3 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -102,6 +102,9 @@
>  #include <linux/uaccess.h>
>  #include <linux/termios_internal.h>
>  #include <linux/fs.h>
> +#include <linux/cred.h>
> +#include <linux/user_namespace.h>
> +#include <linux/capability.h>
>  
>  #include <linux/kbd_kern.h>
>  #include <linux/vt_kern.h>
> @@ -2379,7 +2382,7 @@ static int tiocswinsz(struct tty_struct *tty, struct winsize __user *arg)
>   */
>  static int tioccons(struct file *file)
>  {
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!file_ns_capable(file, file->f_cred->user_ns, CAP_SYS_ADMIN))
>  		return -EPERM;
>  	if (file->f_op->write_iter == redirected_tty_write) {
>  		struct file *f;

