Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09FE23717C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456299; cv=none; b=aWwaEzoWzggTldPLWIZpO1rvdwZdTXhO5z4ub33bGgaogLIV9FJeAmEkqR06UBXIw8Bqoa2Q+rTKhq/dmL7POZ3hLMA58si6TruwDOSl/KpEzlBiMb08W2c9ya9fQ9PqTs5M6F4PYCyrDlzFGkqvEO9UjVyFja3RGe4mzkzGzh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456299; c=relaxed/simple;
	bh=yyT37FVYMxc3pvsuybNv+R5u392ufUHT5onLtkknmoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ib5Tq5mPl6VvosV1HLaiYGRq+gfQZfgkNNcquDb3i1YJ/YI4SJqPO62GSkHhFiAhPkD8LYrdBewCx62qZH4rXmscf7SpQc6WQXGPpE/hi7naSaOizoZGegfEDXZ1J4lq30nz20CD2KCBghUwEykjd+x52Z+wfAb7+qFs4ksbV2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCOr+5it; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCOr+5it"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70b684670e7so2542637b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 14:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750456297; x=1751061097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJHMifKVc+SOcf+N/mU5T07qJGJW3LDfk0F+0ysQoRc=;
        b=cCOr+5ittoLxNwyJn1QlgQLOoNdSXo6sji1xEKNuKjfDKhavHjXIY5qQu3jt5+GbLF
         RXKVib72qig99v1ZWQmkSnmwIgBvcTdYXELauwUdQ9lOxmcGVi0tw/YP0TxZmwdZpdO9
         etGRTem6xT5e6aZn+jd62fezFeiGOwBba4KP+2z3VaEYDx4TpRIQRts1zVGTp5/9csmY
         s5pY5VxQwGGebFyjph8HPG4c9Y9HRrEbndNYqJjKE2qaSJFRj66dW+vARJQ2D/04JgEm
         Lhq8B8K9IXj1DbNh/rIKNkllMNTe38eBueuy+4uMe7KOL+93lJTxXH6v1EvT5HjiYgSe
         vIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750456297; x=1751061097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJHMifKVc+SOcf+N/mU5T07qJGJW3LDfk0F+0ysQoRc=;
        b=enaFKzo8/5T6lvfvtsXEWgLSF7iegj4kqVDfBCOrwLsedmzOAzNO2JZGI/P1ePuVQI
         fOf8SxKWNnL9ALtASPuh+KLU0xe01wQx8wf3oq+Ke2eoItYZlXXY1F412WF/WLGl3dCI
         qxR0ftpbGswJua6ZSqYaap6iWMQt2PUTgmv1/jEIATcI+dSLX9Ce9tccL+PZ1+upEo4E
         2LUMemjhEkDaFZ1MugYafefLeoBiH6gSXFliTKfH/bgIyc4gurT3jDsdA5pqaeqHVhR6
         4t/F1DDiqHNkpaMH4VvP4SviHFmXvTKKvMT+vGwLzTRNr2g9fjl2YwL9ugQTYJKBO4rL
         Serw==
X-Forwarded-Encrypted: i=1; AJvYcCX6+s246FoxUXuxfVBB3vZivnTmGiNWnlOE50MPGfENKqI3NzPgbNljQK+ELshCJlydV7NMBx7Al/dy4tnWkX1jsFYNgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe0n0BvT3gKM3fqCe6mU4mKo5OWBDacY11LemAiZvHI+ly7GzL
	5/A+Z3f3QctS2h88IA7khNSBONIq/RW2hc/4xDCPWh4bhlZEq6mOd4kUVK3V77h5O3nfw50dN+U
	6YWtl/rcLtaxMW0rQQ26Aw7hMO9nnx4g=
X-Gm-Gg: ASbGnctrJn+BYJDK6Gav0lOj5Q+8brMboc5kezNqSNE01KU5bmA0ATyYkbsVh0XJu+y
	udXu/5EbQ+Lbr5rwVoCbDgrUonnV96FnF6MefCuOmdB3gKCuxekj8dQfqXFp0K9RdRujoq8xidX
	s7FDuP0Fbn3Hjg3Ts+lTWum6/EUeGxgr9ToIU2stKfpnySx2XlPMq8kzI=
X-Google-Smtp-Source: AGHT+IH2DKA2rSw+dytJIi10/6die2HLD1sv1v3othTe3lp3JFsz1ecHk5GScFEEWVmflAUox1MnHnrI8upf47AUTfg=
X-Received: by 2002:a05:690c:f0e:b0:711:7256:54cb with SMTP id
 00721157ae682-712c6530555mr34978747b3.7.1750456296685; Fri, 20 Jun 2025
 14:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250614225324.82810-1-abdelrahmanfekry375@gmail.com>
 <20250614225324.82810-3-abdelrahmanfekry375@gmail.com> <20250617181219.GB2545@horms.kernel.org>
In-Reply-To: <20250617181219.GB2545@horms.kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sat, 21 Jun 2025 00:51:25 +0300
X-Gm-Features: AX0GCFtUsm3G5TCCAwjsTHaKQv_Kk_OYKf6HQyFZSN2f7zg3KjZrBsbQqMzWN-0
Message-ID: <CAGn2d8M=Q9DdknYwSUtdb-TMks4CEmMmbNEnSesJA66ahLT7wQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: net: clarify sysctl value constraints
To: Simon Horman <horms@kernel.org>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, skhan@linuxfoundation.com, jacob.e.keller@intel.com, 
	alok.a.tiwari@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:12=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> In his review of v1 [*] Jacob said:
>
>   "Hm. In many cases any non-zero value might be interpreted as "enabled"=
 I
>    suppose that is simply "undefined behavior"?
>
> Looking over the parsing and use of ip_forward_use_pmtu (I did not check
> the other parameters whose documentation this patch updates) I would take
> Jacob's remark a few steps further.
>
> It seems to me that values of 0-255 are accepted and while 0 means
> disabled, all the other values mean enabled. That is because that
> what the code does. And being part of the UAPI it can't be changed.
>
> So I don't think it is correct to describe only values 0/1 having defined
> behaviour. Because the code defines behaviour for all the values in the
> range 0-255.
>
> [*] https://lore.kernel.org/netdev/8b53b5be-82eb-458c-8269-d296bffcef33@i=
ntel.com/
>
> ...

well , Thanks for the clarification , i will only keep patch 1/2 in
the next post
