Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495E35E1AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jun 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016529; cv=pass; b=RyMrkG7Viaiz5YCLEpOgFVmXeSHGcfvYdUfjFaYuFXl1mYzVpXt6tjgruXRNNC0/dN++FgtLtw73ZI5n0xd/TvZHVPJHetHSmsa1eUQqf9i7EeMXTn6DExNWHpzgf6J3zLUErgeMeUnedLlXQkIv/g4hPLzB3Nu2sVelZvjudQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016529; c=relaxed/simple;
	bh=+a76krTz2XmJx/eLQrkwaJT7VfP5qKUf/8ADCJM/SrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWOdJM12r/u6RuaeShXKQr8yBtKElU/gL/+NHUQe/rq02Zsoy7Yd8+4R28rTvf76ZNzpuebKC0IbhALKdADM2C/bxdWfNJPlHWur2Bay3+mv6KJxhK3xO1cY4UeWyUhfIwqivgSBuP6x69Le8OP3kAh5rFABI8Ufx89rziImSNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=f50uAe2P; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="f50uAe2P"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B845B42744
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jun 2026 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hogcmRli4uU4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jun 2026 14:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=miklos@szeredi.hu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3D6B40680
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D6B40680
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=f50uAe2P
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3D6B40680
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  9 Jun 2026 14:48:45 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5174a3a025aso57597241cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 09 Jun 2026 07:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016524; cv=none;
        d=google.com; s=arc-20240605;
        b=MewGnLHwB6wwJmx9E9DWLD/pGbJAdIMzTxiwyWDxD1SU9aG6VgKxIwa5pyNKbQc9+2
         D4cfuN0uFW0Hkv2UqAuhf71NGq/IhxcJWdV00E77PQc0fCmsKj8t6+h7ATM7XdMTdcPB
         P26waTJ0FhrQnyv28ec6w07XXBHj8fHb1MMuqJzO2jGLG9vFzU4SC0yc46NGKZuCWDJ3
         UrblsoXV3IYOeJBcRHFG/vqPu276W04sKJkeuUTuvP5fKF3wN0L6WtkUEji69q44Nqab
         QgJYJXOQp+X4AEnwlSy+oNGodEQQUxlPzewBouyNcfLajj5o33tPv6OiPS85vuYpov8a
         hLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+a76krTz2XmJx/eLQrkwaJT7VfP5qKUf/8ADCJM/SrI=;
        fh=K5Jm2egTcfQc2XN9BJIdICpxlL9Ky9uoSOQ4WhNUxl0=;
        b=O0RJ2ZhxCeZ+plCxgjTvOFV0DU/QVooAJToRx7o7hCrOI6ltxENbqGLKbOQwEAMYAI
         Nn+T8Q5/U4pk/FdwZ9ouV0zQeGnPJwEjM/6bqSGSXkOnGIGkeFwgiin8ofyzQ0J6KU37
         83CBgdpl9Pvo49ahh83+MG1u42Jh3guzuh6Xcuhi0V7xQ57TdjhdG5lufIP14IBVqKzD
         SgBdh6VAMxbCxRhoHJoc9KaTJkhQmzGWgfkgn3ZL/gInyHaFMaWVSDr+EKTN85yge0AT
         lA+2BE8mjn7cz632NkuKhcIgrNV0bofO0oi5DZfPUB3MYqeLLfP0muM0GrQxTeBwYKLW
         kaUQ==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781016524; x=1781621324; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+a76krTz2XmJx/eLQrkwaJT7VfP5qKUf/8ADCJM/SrI=;
        b=f50uAe2PyIBpEuIDhjlDnaKsdR0VJ/lKMJg30u+Ui8Xo4npYAO8yDhWUV6AfK2BvNa
         y309XITJAFYiKZ8tWwl7k+3qC0/Vi8ocSV8mCZm6SreuAHGTYd7ZWuthdAoOX6WV+laP
         qtHr2zNP2UTzgAqDn3/hEfA91xu9gxconpLqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016524; x=1781621324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a76krTz2XmJx/eLQrkwaJT7VfP5qKUf/8ADCJM/SrI=;
        b=pNHMqoAqoScUcX6QY5YhCxrwBNZ/cqd5gu8xisyV0klekyt6A3+zRc3oErq2xghTGN
         4aiOQA64LfsWjkeKKrpFU0vM7rtHRrNfLvDLEtQaSQMDefnWGoAhvvU4Lc7QEX9PFKBu
         QequsMn3B6tt/g16RnEUNPCrSODDPtquhMNW7NhwOAqHTlxXMRIggW0UmvkZLJ+mRcFj
         bqsOZFewRORXPJPKexRgCrEUUjM+JIw1IPG6qxKpv9ccdnscAbb/IB/yd5tKueSWt6xQ
         Ld+42qZapzzC0ez/ne9cJRErjlkc6cdRnUdYNmX+utwtbKEmngEGqzSlbaND7xYBuAxi
         qLJw==
X-Forwarded-Encrypted: i=1; AFNElJ/D1a8xP5iVHMhQgwXM7EJ/By3Xu0Zuo2i/FgeMCU1b4dxXfJmJ6MWCjlQFRhGB6+UWZKXTHGsV4d0ACHkjxF03AKQYDQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxpdTk87XexVv/ZC4ETVXA1P3kPwQyEPw+MQbREjBbHvURKSoHP
	ropODQ8NRu5xdSAfMMl9yVF5k2mAxvZ1R4giBfWH6s7gk33hGBBp2VyqsulZY6vxoHpFLfYMQkZ
	nE0bL4BGnDS+H/cV598ob89oiKr9P5zBcDm6FrgechA==
X-Gm-Gg: Acq92OGJjlRHPBLO8umZ4xxIImIdrkxk5DpMw1Fk2KKz+NPilZ1vZfk+WzV83Gef/jv
	ieW6lBDr5/teASsFAW4xsKXWkjSskcOF3wkkaflQNBOnKC1IfG3Jn+yKukSkZz0UHtskxdQBH0F
	KeQs2efl2EeJ6QXtrFSsJwZNuHvnFe8pJFEgMqNGHzGZx7LKsMpsyNOfis3/8sf8cOyXD+FVsjz
	YXJY874NnTapb72NjSE/AEu0FSShyWyrGGFFcGlS5rtIwMy6Wt47EkV+2SyVEqy0cTkoL4kNzJM
	CV505BMCbv95DUB6o6xiFYHHRfUmCe89t7ALJJrkHuxHlPvJgoY=
X-Received: by 2002:ac8:5c83:0:b0:50e:6313:6e13 with SMTP id
 d75a77b69052e-51795a829femr290022861cf.5.1781016523708; Tue, 09 Jun 2026
 07:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260607175832.14378-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260607175832.14378-1-mahad.ibrahim.dev@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Jun 2026 16:48:32 +0200
X-Gm-Features: AVVi8CdZ4js0VeRqh_j68vBF2z35GcygI9fU_Ch7SsQ7zhQ_apUd4JjVOTi5BAs
Message-ID: <CAJfpegvi+gnwV1+a_QTSvJ46-4_8LGoAsU=xbqE4J4=m5RU6rw@mail.gmail.com>
Subject: Re: [PATCH] fuse: use min_t() instead of ternary operator
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 at 19:58, Mahad Ibrahim <mahad.ibrahim.dev@gmail.com> wrote:
>
> Replace existing ternary operators for finding minimum value with min_t
> macro to adhere to kernel coding standards and improve readability.

Doesn't improve readability, on the contrary, it obfuscates the real
meaning (return error or zero).

Thanks,
Miklos
