Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D721018A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740250833; cv=none; b=tij93Hi4FJMWcn22BZ6ciZo+tIJcBhVhvIDHLalItxWBelMSmiJnueIhVkdD/NFKH+nFOwpoFHRgHTgS+ZTJfXXyiRvNXIPYXnh75i5ateT4cT9jdTR1rXTXI5vCrZhBz5Fjp2Rz63s7GPV0+vv0sCF5ftw4XQH3j/oTo10XK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740250833; c=relaxed/simple;
	bh=zWRtAtqNqzxiBe46ewrMrlO3cYmG11wRcuinLSkGivQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uctFzGAZc92Ok8XHWq194T+V2hMz8oJaZkbJ9wBN5yqhKOfnSW4vKuH7jY9Ulvkg3wYH5VI2Ub5e7fANBKRKWAO3RgBz2U0C6ot+FkRzhswKQ3J7dRIdH+IiFRIW9b3RhQ87ZkxNeIkXqrIDc1XSXcCql3xuCQPG+qzP12IEH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqZyxdxR; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqZyxdxR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3E5813E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 19:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK59L0ymyOqu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 19:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=imandevel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7455E81255
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7455E81255
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kqZyxdxR
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7455E81255
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 19:00:29 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-472180fec01so29837391cf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 11:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740250828; x=1740855628; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mf3WLnT/uqvc4jU09LwEl+Y0jld6Kz+6VRNuRCDxgs=;
        b=kqZyxdxRRovcsnJ8QbPjlD1LefLs/BtJKaLfcnFV4xB9iYfx+oBtqBtpLgh+VzHv3a
         cbEMJeyglMaz8gIxMDiXYIL6IvvPHFEROYsF767DOGHem4eRXxTHaLASjztqp34VKuGn
         CTIoqtDZbO378SPSFFNaJ8D9zgWGBxaSBKFQRevC97F2samO1DO76s4wIGBC/8KXke4T
         4Q7QUlm/obN2GYFAkfZej0l4mOKZFuKcE31SCUyKbxukQSNyRSTf7DeqVN2napjgtMxF
         +DBiWKN8jp0zjxb1cNszCWj8KLbRrkDlw18NTViKSz4pyhoFRGGEEqjfbXuMIRBNY5JP
         9t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740250828; x=1740855628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mf3WLnT/uqvc4jU09LwEl+Y0jld6Kz+6VRNuRCDxgs=;
        b=Z5aZP6kpW3S3jaMH9K8cwobyeL5uYpVky5bAfXNWmQeqMUNw4tLyUfq4estHMRxCdU
         T5PyyZ0pLgM5SlVD9GuDe1PdVkaN1u6P4ZGYfL8PoGes446IeBTv7kquW2YdiWHIGjHQ
         44GHe1LBz1DPhO0LkFXxRDR84eG1qCayHbwb07swo2L05SJLX2Y4S48Qz3x1PWVkw8g1
         jeqBQVa8TB7oQCf8twqshThVVy2yh5zNGRNuuPrBuEFfUnlo0x7jyXZfOiFflF3H867i
         rltuKhnRxV7+QPYaKZrZowgioPOgqg8xvG0MYo5TYsfFy21lAHU40PzC8uWsI82CUnv9
         KiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTDCmmB9Me4uvcD8hKUTvVvD1Wy5d2fysOtVC0NmFaEjndT5H5SVpCEpCevhVDba80wK7FIFYCSBZVLO+bcKeuX6a/Aw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwzpvV8EzxFLIPYeVcfOHpdnPFS5U9LI5PWff0jMb0JdponczsG
	WXL9n9/0BpyvtBW92aEHoIPWl2lIJjcyfS/9Fcstt7rih98XX73r
X-Gm-Gg: ASbGnct+LL4gs0udfo89Uebyox2FDn4O/algB1tnRJtF5WdBxQOpY7cDv4S9qe5PeOg
	YcsesmUATVu30Gzx3/e0j41JzPVi1MCzQQqrnE4FnjkjuvjqsnCrCi8q6v27Ny+XLlX2OHnea2V
	kZTVHphOviCTwkD1kTANm4Cz7eP2amJUyx9GQs93NA+h5AJTo3O/c0bqr3/hwZt7K88RTP6EXZc
	K4Z403HHIJaQBOz6DeTxzoI/dJ+9dio7dHrg/0As5WHAYMRf9wrRYQePkOV7QsXAFI8pSAqp5rf
	MQv1pKTJ3B4itRdhAa1Xvb4=
X-Google-Smtp-Source: AGHT+IH3EYjDKPoQ/e0zJiaGtwJhz0k1Ov8NHAPdHjRC/le5ACQyzWR3UwrkNbfa/a8/mVoIaYX0Wg==
X-Received: by 2002:ac8:7d4b:0:b0:472:636:f60e with SMTP id d75a77b69052e-47222945029mr114554481cf.34.1740250827709;
        Sat, 22 Feb 2025 11:00:27 -0800 (PST)
Received: from localhost ([142.198.73.227])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471fdf8ac21sm60434901cf.19.2025.02.22.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:00:27 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
Date: Sat, 22 Feb 2025 14:01:13 -0500
To: ritvikfoss@gmail.com
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftests/mount: Close 'fd' when write fails
Message-ID: <zshes4xtyir7zrrybeqj2amrxyctwqnuvx2tqyktv4vsfstxqi@pvdq2rb5m47j>
References: <20250222114709.50011-1-ritvikfoss@gmail.com>
 <20250222121249.50588-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222121249.50588-1-ritvikfoss@gmail.com>

On 25/02/22 05:42PM, ritvikfoss@gmail.com wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
> 
> 1. Close the file descriptor when write fails.
> 2. Introduce 'close_or_die' helper function to
> reduce repetition.
> 
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
> Changes in v2:
>     - Fixed formatting
> 
>  .../selftests/mount/unprivileged-remount-test.c    | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
> index d2917054fe3a..41d7547c781d 100644
> --- a/tools/testing/selftests/mount/unprivileged-remount-test.c
> +++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
> @@ -54,6 +54,14 @@ static void die(char *fmt, ...)
>  	exit(EXIT_FAILURE);
>  }
>  
> +static void close_or_die(char *filename, int fd)
> +{
> +	if (close(fd) != 0) {
> +		die("close of %s failed: %s\n",
> +		filename, strerror(errno));
> +	}
> +}
> +
>  static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
>  {
>  	char buf[4096];
> @@ -79,6 +87,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
>  	}
>  	written = write(fd, buf, buf_len);
>  	if (written != buf_len) {
> +		close_or_die(filename, fd);
>  		if (written >= 0) {
>  			die("short write to %s\n", filename);
>  		} else {
> @@ -86,10 +95,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
>  				filename, strerror(errno));
>  		}
>  	}
> -	if (close(fd) != 0) {
> -		die("close of %s failed: %s\n",
> -			filename, strerror(errno));
> -	}
> +	close_or_die(filename, fd);
>  }
>  
>  static void maybe_write_file(char *filename, char *fmt, ...)
> -- 
> 2.48.1
> 
> 

Closing a file right before a process exits is redundant,
since the kernel will clean it up automatically anyway.
That said, whether doing this as a best practice is arguable.

Cheers,
Seyediman
