Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4562E5B0E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755817034; cv=none; b=RRf2pN/msI9MnJOC5DnTwcFEs85rXgsHP5gWDaNZoPhC07jIFOs+YDl/MP+aTDyKrq9edqpO8aoKHqD2IzG+eajjuF943oBvShS+heqAhdNbmOdzrusuVlHIzYmYAHtfv5Tg5wXw3YWwWdH1oIxRZ/js8v/rpUTg1q6WmhV7AKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755817034; c=relaxed/simple;
	bh=gjNGlFYrWdAxwJw9cFMTACnKXVbNl/94mhTpU0ua4xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaxBdARB/XDM1sTjBR1ypmErohpW+B7oNEuQHLJmyNp8SyIFhs1CUR5tvUWykxYQxTxLO8BtJDy8P2eCDDhTp9DJajHqHVOh3qmucOhZuj+7XQR8ty0qVggMO7W6KlurbqHbCdWDYREd529i/wCzFuxibdwOVkcU6GdmoquBBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THDNBa6Y; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THDNBa6Y"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F2D80581
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjuOi2vsFXJR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 22:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CCDC80E47
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CCDC80E47
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=THDNBa6Y
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2CCDC80E47
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 22:57:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so11363265e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755817030; x=1756421830; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tLKs7kTK+4hcjMq7nRN9dNEk8LtEip2NyviTVvyZITg=;
        b=THDNBa6YFgpcefPtyX4JL4WTGsTm34fEoZd/XXVgNvQiyQjcNSU6xyjmQbVEFcLXKg
         VcSrFY3RZ+ve2m0q73Y1g3KHQnUpzwdBokGQo5BexziK+AYG7JTGHWtLlKRNyZO60EmU
         wvP5sOiAdxL7QYTiFzQMAAaxH43/mAmHk0Pd40MTx4W5Uuwo7wjc7YX2nvd3SON4SueP
         635i+uATdEiA4AJgCdJmGA+8A48JGKoXmbnf0i1rFgPXlrecumZyutX+ZIXf8fOu7Tda
         74bZm7rLpk2poaBW52FBpQH3nD1bWxRI5xb3eKZkyFwDDBnDHaScIV2giS+nnFnTWtb4
         vbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755817030; x=1756421830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLKs7kTK+4hcjMq7nRN9dNEk8LtEip2NyviTVvyZITg=;
        b=Ok00+P94Srefc1mmlGGZraCYio4b0iCl1Q+zT+GNpyBCcxuyhm9esT4jcmtNkzI+Fl
         fXEyZCypob4SgeKWeWPRS9Hr+GoqCUmQo912sDo9prlIZGtWejkkxmmYqPNOujJvGSZY
         16pcJ1ivEXMx49ggiTYV0HBkQhGwQI7HNdQgdHrsvofVcU5q4hCCV8MQefRFLPCM7OXe
         uztSu9XWGt4HYRB5nQr+ZG5D51UsuuPO7NMnMx5XlQZX6KR4v2HSyAAZAn7BQ9g7R5sU
         WBr+rf0vLzs//qo9jgwSbYUSOjqjA4hoebhSSeqkumj3dYlhmIUavvjDgKy/CBAD3Po1
         F21w==
X-Forwarded-Encrypted: i=1; AJvYcCXeGnXLoarjjypIZQRxIlhBJnlcN4LFu89Qq32lk9WStq4T3RJbt3RoCnq5e5tbBHNTAjG8SlxSaTPN/URN4Bv8EYfS5w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwjoO6bQCrY9yLlnSOr8b/L09aTMx0/awGv+GUlKH1lSvk3rGQU
	tdaggWGX7zyhEKy4Md9qUtH39+BKbLqAoMf5SHU81paLIwq+iHA+j2Bd
X-Gm-Gg: ASbGncscsO/72Con4RbBdl0fdI4gH/SUbbzIcgrJktVRnUPM/3YWHfwnuj4980KSAK/
	smS1u6E0TjpNXl5/FItIr401AqRX4tWvH4hz0ZI+Angd6VtEpxXowy8NNflWe/Ths+JeFNSeN2J
	YfZBY73wBsWOBzF1f5SH2j5icbMNGsZAqpK75u6fdmYVoZ0hOezHHfyZ44SgwPvPzjRB3z5XJw2
	E8hqC6pFHJ8oglA0+xFaUK5KgYWRXmL9kpBmRa265Drn1qlT9gCctuE5BrAKwhJ5qrpOeQkJiEG
	O4tqmDjWL+icfQ/rb1bZkoxT/9+PQilSC3MVxrPUg6c2JQdnygCD5bWZbf2FB3/y1d+K34xcyRH
	kk0MfPr1O0pxPZLxvZ+f5pzJI5S5Qw/vX3jsNMJFsnnbG4rzFoJmEROmhPk5IkzEYQaYpbrv6Km
	s=
X-Google-Smtp-Source: AGHT+IFOkdJXi/riVyjR61X1ulOdIUxV4W3ij/Q4IWrHFGzdHXPBWukoRxT8mrsmftUQOsDLFBCJIA==
X-Received: by 2002:a05:600c:3504:b0:458:caec:a741 with SMTP id 5b1f17b1804b1-45b517c5d8bmr5445465e9.24.1755817029657;
        Thu, 21 Aug 2025 15:57:09 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm12615605e9.25.2025.08.21.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:57:08 -0700 (PDT)
Date: Fri, 22 Aug 2025 01:57:05 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org, 
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
Message-ID: <uzfke2ry3rhdirqpdb2bdjkoemj4rgtfwsio7yf5la7p3p2ait@6umacnfdeto2>
References: <20250821200132.1218850-1-zlatistiv@gmail.com>
 <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
 <CAHjv_as7m7UbSLAPU6hX_=tAvLZYR_7Q=1n+Xq-nW-6OJ237PA@mail.gmail.com>
 <f7ff446f-2a9e-49dc-af7a-6e4c76803471@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7ff446f-2a9e-49dc-af7a-6e4c76803471@sirena.org.uk>

On Thu, Aug 21, 2025 at 10:30:50PM +0100, Mark Brown wrote:
> On Fri, Aug 22, 2025 at 12:17:14AM +0300, Nikola Ivanov wrote:
> > On Thu, Aug 21, 2025 at 09:49:29PM +0100, Mark Brown wrote:
> 
> > > > -int num_cards = 0;
> > > > -int num_controls = 0;
> > > > -struct card_data *card_list = NULL;
> > > > -struct ctl_data *ctl_list = NULL;
> > > > +int num_cards;
> > > > +int num_controls;
> > > > +struct card_data *card_list;
> > > > +struct ctl_data *ctl_list;
> 
> > > Nothing now sets initial values for these variables so they all have
> > > undefined values which is buggy.  The code is relying on the default
> > > values.
> 
> > Checkpatch reports it as an error, it looks to be part of the C
> > standard that all compilers must initialize globals to 0.
> > Though I suppose it helps with readability to see
> > the num_ counters assigned 0.
> 
> Do you have a reference there, note that these are just plain non-static
> variables?  I wouldn't trust checkpatch for anything that isn't kernel
> code (and even there it's got issues).


This is what it says in the C99/C11/C18/C23 drafts I found:

> If an object that has automatic storage duration is not initialized explicitly, its value is
> indeterminate. If an object that has static or thread storage duration is not initialized
> explicitly, then:
> — if it has pointer type, it is initialized to a null pointer;
> — if it has arithmetic type, it is initialized to (positive or unsigned) zero;

"static or thread storage" referring to variables declared at global scope 
(regardless of static keyword) as well as those inside function scope defined
with static keyword.

Since as you said checkpatch.pl is mostly intended for kernel code
(which I was not aware of) this patch is probably not desired.
In case it still is I can add quote to the draft and link it in the patch.
