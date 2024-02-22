Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6A168BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708589594; cv=none; b=asZLfxGEsgj0Smy4dRSjSKlf939u68MA88kYy4KanlEonx9K+fEooSOlAerh1YQkyNurOrLunvQV09nbh7YJmBf9p2Bwh2QU0BkhK1Pe58z1OSdQVhSgLRYqzDXDPhbxjsX9J0708IdDNdmjd9Wdxx7LZ1/ya7fpqBrXpaE55+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708589594; c=relaxed/simple;
	bh=KnY6kaip9BM7FrJjonxxh3mpPi8qcS0JyCecKgQh/gU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=pqwuGc+F33n5bWRDqi3GqHlyz+S8FmDagmsPAEGi89cRPJ3rystzEwHd1NAj82nMyzqHD3QyCXEqT8h5BOManov4ir8QwBt0ki29CcUgo2qktFto+hk5sG7+SaNosTY5f8ax9PrSx+9su4B+XvhOLebHD1oCb2yIYm2xMQtFZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQOeytiv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQOeytiv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97916415A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nF0JzH8-5QhN
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 22 Feb 2024 08:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B5D6640332
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D6640332
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LQOeytiv
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B5D6640332
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:12:59 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e22e63abf1so3595448b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708589579; x=1709194379; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnY6kaip9BM7FrJjonxxh3mpPi8qcS0JyCecKgQh/gU=;
        b=LQOeytiv1DDdSVUUO37yoPgRVzxFQpC1TWlC5EzSucNJhlNQPWq7fef3Tnv1Yn+hwI
         b03OAqzujuOIRaJhiuBCr39391EE7QfD1NhWcj2Pfm1HhCiI5LW11DX6bvfqYj8vI6Pb
         8XDgGCmUdJ5OvUifA2Il2dsBoOw4dPqjulRBKgJQZA6ac8BMQ4UlyTay5desNeiblS0Q
         YM7M4TMSU0w2z2Ib/k3EcWWst2xT8k+KvSy14UrmWhLiQCA20+iHKoJMCZnt5gb7NhV+
         gDf5hDvoi7fga5qQpA8kc+hDfEV/vVsGcluDgQztu9fqCpJ9IwsWggVegLKejS1wiQqQ
         Wvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589579; x=1709194379;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnY6kaip9BM7FrJjonxxh3mpPi8qcS0JyCecKgQh/gU=;
        b=CTPcclyve0YvbN/aPxftnu3txBgb+YE06glbeUSVQ1+ItAPdJ8HS9Ftf1NuoVjlAtU
         thGTcj1O+OAQ3balbFb2tGEtIJUqvWhQBHivJXQt56wM8RuFYeTvgPd+JOad97MuK9ap
         sJGX93qemTWCgSU7VjvwpYdpnP/h1kTCHvB2jLNLUAK6XBANu7DKSaVd3BjkdO+6gyAa
         P5BTWzOqsO/j50wefKHpbsxKw1rTK20jjX/qvLhwJDXfOej2zcxjbbVPp/HWuKphheXA
         OMo6o8S/yLQRY8vero6VQze1lPdVjZPMFqIjx0n5VN01RIqpN8+C3+bgYFY1KqFH7OoO
         tccw==
X-Forwarded-Encrypted: i=1; AJvYcCUpTzhmzqiRmbfdn12ofZjluWIx3gRmjwucnTcSfIOI/sNDkwtDJIW3i0uHdCt0zww2iLHn5c2vlN750qENCtt1SoQV0HQdGmOlD44uSYXKH4xuJ06KRvmvA+h8n+YR
X-Gm-Message-State: AOJu0YyOfd2X839Ac6G2q+ESVzt/BUP4MPB7nOVhwY9vuYqZFxKJekG0
	BA7LoJuE3Pcb9Rb2jtf8f558cfI/jyINpq1NvnkYIKeB36f6CxFW
X-Google-Smtp-Source: AGHT+IGgPrGvMG2ZkFBWVBhR0i51muQpwt/Ba+RuSmY+zYMXUKvg0MxHxIJRPZq8F9TAPfuvNzctaA==
X-Received: by 2002:a05:6a00:6815:b0:6e3:cc8e:bb40 with SMTP id hq21-20020a056a00681500b006e3cc8ebb40mr10231403pfb.5.1708589578839;
        Thu, 22 Feb 2024 00:12:58 -0800 (PST)
Received: from [127.0.0.1] ([106.221.232.11])
        by smtp.gmail.com with ESMTPSA id w20-20020a056a0014d400b006e471c54861sm6161032pfu.210.2024.02.22.00.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:12:58 -0800 (PST)
Date: Thu, 22 Feb 2024 13:42:44 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: nstange@suse.de
Cc: jikos@kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	live-patching@vger.kernel.org, mbenes@suse.cz, mpdesouza@suse.com,
	pmladek@suse.com, shresthprasad7@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org, zhangwarden@gmail.com
Message-ID: <1da6e25f-3f1e-4acc-8256-53fbbdc29e78@gmail.com>
In-Reply-To: <878r3eyoku.fsf@>
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <1da6e25f-3f1e-4acc-8256-53fbbdc29e78@gmail.com>

>Is the declaration of klp_get_state() visible at that >point, i.e. is
>there perhaps any warning about missing >declarations above that?
>
>Otherwise C rules would default to assume an 'int' >return type.

I wasn't aware it works like that. You're right I do see some warnings about implicit function declarations of klp_get_state.

Regards,
Shresth
