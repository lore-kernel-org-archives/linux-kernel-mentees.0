Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CD13B293
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 00:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809224; cv=none; b=kN585JG1jDEpXp84lSl9EYKPq7o9bHTJ8hHKSsz1LNJuOhxorXpviKRlOETFz5luZ+OGGCbdxn+/pmnuBUPwL4uEhv4fgXVRu0784VMomWAHVe5PRHLURCTyl0/xUFAGq5RVF0rZV2xSY955mFJbs8jk1lwo5nWQvSMXasnbnPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809224; c=relaxed/simple;
	bh=iCqQu8YiZuW9HA006Q3yyvDDszNFiwK4fDW6js+q/dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKAoTm7jbhDEtwmg+nMxsunUPh/4vnPem+5fNOW46WhUMxdUpPQ4BdYW8Rjvy66/E93O0qGCOzZYT2W9OT6zI2XPRjTZh6ZZHLfx162oQJv1K/c2JvuvGrNWuIdDbrcCDZ0HXlersfj/Aoc6s0cw/ZICcS+aWgJuqp2hYQpPQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2TgSUwM; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2TgSUwM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7ED83D62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 00:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qo5lKYgwhTer for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 00:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=cmllamas@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B40AF83D1C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B40AF83D1C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o2TgSUwM
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B40AF83D1C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 00:47:00 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2980343d9d1so44415ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 16:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764809220; x=1765414020; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRPKWeZ5Qund3cw/ji9ZPyAMDI/pWSSKTsDwxtv2M3o=;
        b=o2TgSUwMYjiijGTW3OZFV/WjcIJ7QBATDK4tmw/unTzO73W43212q8TK+BV54IWNYt
         hwvvrn1IB78ljhi3kRmQ8TKwQ8bBYZNZJwNR5CP09JTVHLIHDqc6OwLWlGtmV8k8/R1h
         1AUZGTuy41fb0cB447hnyb89iU0HaeYB35UF/pVquuaw60OvoPyLeIgT/qZALVnKxRVR
         PyvvyLtf2l/6kKl/XWwnG0k+/961vMw4/I01fyydO5nvYJGN/JVSviBSCnc7X0x96/N0
         DuRh5NhfwpPlNev9owUex5Arvb+fkU55ayB7tRqcSGv6p3OVi/CXj4Q8Ngz03EL5o7Zy
         itMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809220; x=1765414020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRPKWeZ5Qund3cw/ji9ZPyAMDI/pWSSKTsDwxtv2M3o=;
        b=Dnr+1r9jTaPnUqfWqzXBhlR8xLsw0Kal6quaHt78RW+8fVf7rwo2TNdcTQMGREKVci
         YP9TlBF4/zUDUO91HaUIrZhsKMCQU2r/8UXnG/yEbA6Dx3v2199ZDkA5PaWo6qoYKDVr
         enQdIOFVGVPCMlWYTmxhDdWtCkMbKy/lNPaSiQ2LU32kkt8ETM/vaVXuT8mErcoOBNCw
         HZ8rJIA9Jk3yHCV+M+OapfzYWsEePumTJdxEHmf7L+VFostGKK1WzOLTUL/cevmotzoZ
         +k6Prh0qWRqA1Sw3g/ahYItHaWpO/64iJWhF8KIbbiPT/ENLscI3rAoFreSsQt4Ydbi5
         Ks1w==
X-Forwarded-Encrypted: i=1; AJvYcCVVPOdOM0E5cCowEfh+WZXHDJzSN2eOnh/xAzrEr6ZZt7nPZpM7dYs5y9ggfjOGYR0kxvUwcZNXaeer6tNBas2d5YRuDA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy8JnmnlA8nG6pz+dfsxPbXdeUt8LzEqFHJEEJVD/YhnOgH4BQ1
	SWsn1V3MF9SyIJF3P5j5+JaCpCxusJdxnEaB6UnqSUshE92dLcr5+J/oId3EH8dIwg==
X-Gm-Gg: ASbGncuJrRIpqJPEJX7eRHmQ3gyvxzJ+iFDJ2OkWNRwfW41HXWT4ep0hAhHVhS4q1H1
	nytjAaJGsUC1/BYJvVeUAl5CPEbEeqarjbvIa+7D/SEimfzXHfQI7gp37fdFUU6IiVsl0l3MysE
	1eIGLJKBod2q3I5ndwyXPWXt1IH8S8LFAHfTWktR00tAhLj98/sV5Xpj4ngzA2+yKpXWb6IsVBt
	0akSwO5WjJrQ12mg2dPuCXeQbyJLOeUXAofEe2JL7Q9qpSlG9v2Ne3JHi5qd4M2LIRef2DcUVvg
	47Ktnfu4MBfI9Fvmz3QtDjykuT/OYlbqHLLcrrJNdC2vTzhxzq+gxYx7IsbwZazSKBYJZtXl2aE
	gt52L2M7pYigDtYB4knYTouirW0p03u2ECnJJRj0OVFl/5GzDqBnvtD/WV+XQOb81Z/ZljDUxo9
	OFYLgo9JiwiBXkbOZ4LcsS097Iht3Rh62jiV9mBG4N14u9Hcbbsw==
X-Google-Smtp-Source: AGHT+IH+0aCy9fVrVSrP2Dp9OUkIwTd4pk1PbNhePVAvYe+rYXBQsI8pgc1ph8mnkBNbWNx/7/TL7w==
X-Received: by 2002:a17:902:db04:b0:295:30bc:458e with SMTP id d9443c01a7336-29dacb15b9cmr720725ad.3.1764809219739;
        Wed, 03 Dec 2025 16:46:59 -0800 (PST)
Received: from google.com (129.35.125.34.bc.googleusercontent.com. [34.125.35.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2af843307sm163296b3a.61.2025.12.03.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 16:46:59 -0800 (PST)
Date: Thu, 4 Dec 2025 00:46:54 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve <arve@android.com>, Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/2] android: binder: add missing return value
 documentation for binder_apply_fd_fixups()
Message-ID: <aTDZ_oKCRjGe6RNa@google.com>
References: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
 <20251121111203.21800-2-adelodunolaoluwa@yahoo.com>
 <aS8dzB6-CGfitagu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS8dzB6-CGfitagu@google.com>

On Tue, Dec 02, 2025 at 05:11:40PM +0000, Carlos Llamas wrote:
> On Fri, Nov 21, 2025 at 12:12:03PM +0100, Sunday Adelodun wrote:
> > The kernel-doc for binder_apply_fd_fixups() was missing a description of
> > its return value, which triggers a kernel-doc warning.
> 
> How does one trigger this warning? Was there a report of this? Can you
> add the warning you see to the commit message?

Ha! I guess one needs to ask for this warn:

$ ./scripts/kernel-doc -Wreturn drivers/android/binder.c > /dev/null
Warning: drivers/android/binder.c:4674 No description found for return value of 'binder_apply_fd_fixups'
