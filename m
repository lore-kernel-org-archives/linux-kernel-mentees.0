Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D567C46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708430039; cv=none; b=NYoF49M4LaQoZ1HZSe9+k8DJHuhKtHJDOeeJIMS3JP8jrgc2f+nkXnmLoCoEsFESitKNedDkr3bVC0qT8NG7+4fcg1GTCXBszKG+Dky9YayPjlwhKXWhqn1Hxx6DbC75BvtVpHLbD+Q8ffQtiUv/IhOJLKvS5jYL0sk5W8STB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708430039; c=relaxed/simple;
	bh=LJPa/9V07e+LPEX5ZQTYTiIo6v8zJZU41X6xs2KJUVs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=CtY/AoTnVh8KvOQjomeJivR2xFnvD07vDi54q8atD9Ko+5IKsV4yeECiRvOrmqwyhD7Dt0v8oH7hfveHPQrVjOyDdV9v+rDJkQNmU/RqpzmT5ST5LY8qnpMEsW3wKjCLucKS6jGXfyppocnrKkKUqGF0o0IztRv9OJW/sGgP48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WENuhAAn; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WENuhAAn"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B9960852
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 11:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvtWhU4dc4y0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 20 Feb 2024 11:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6582F60830
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6582F60830
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WENuhAAn
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6582F60830
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 11:53:57 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d71cb97937so51583795ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708430037; x=1709034837; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJPa/9V07e+LPEX5ZQTYTiIo6v8zJZU41X6xs2KJUVs=;
        b=WENuhAAnBWKUGYEi4qQOLftcFGP/oP7tjhaX+QBtQuNWzmFODgabdnNcnHEB3M5tJL
         0vAS3f6aLdCY4JUmqbJB1qnxABCiKE5A+XujOP7NTUZPfr3fctu9rCtUuX5/HLWNXLgZ
         ah/Iurr0EFXlS/kEQDL2tqF5JrcK1KKgCRP4SXYB3Iw+akWyWPsLbDer3nngF947TRzc
         7fyicWqwfFIB0wb6QoRjGw3F1o6FIvwhKuYx1PPTyiSpl7yWaj7WWQ9MKIm4xscpbTuz
         dI7uBp9rUomMNW95PdAbjRr5sbr2iiP1fe9Ao5tXsmrZpkXLm75AY9LbdDzcevMRR7cF
         XF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708430037; x=1709034837;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LJPa/9V07e+LPEX5ZQTYTiIo6v8zJZU41X6xs2KJUVs=;
        b=fQpkWbhGSyvbV/i03Rs+7GNKqD9Gzj7TaMiHrUYkXSUFSSFPZTy1yTRAjiJ0ZNuRPn
         0ep2/MZzcp8uQNpswSjC6J6KQ60ptc1tHLxAahzESgZ8K7J8lJAwCZJ8VmiYndbDQi9j
         SlAy6E2Ba68gtzszY3CSxDkuhv9+fMVDCLgt3ddATg3CjsVvhmaom5wlyHviWk9vcm29
         iulNf5cOn3SZx/sbAWek9UhfLKubHf5QtgpnPd4KOHCGm5TUxJ3FOQGJjZkJYFMT9wqM
         7FUNW9Sq7VdRh3cDUiGREPFT7Sb5AbdpOqNkqZF3bIY02jSNvbgS0qS+dACfhzyxObf8
         YPPA==
X-Forwarded-Encrypted: i=1; AJvYcCUIp5JqC2n3rBKu01uie6OpGhV1L44K31RnUhR0NTn53iBPh+NOdodmmySOTcpBpBjbmppIS8NcyyftIYHbF2fPTPPUpvRSDlRKYg2pob/B3c4OiXQd7FM2mh6yG7QY
X-Gm-Message-State: AOJu0YwPvgvCbBj1ZJDivF/KRtDrkC1cDSzmn+Bgp7gqqOxCeXR9+T0K
	S2vr5Lq2fI/iuHisqpH/QfCpy731WW+A9KE8lxcyhSIBrDKh+X6Z
X-Google-Smtp-Source: AGHT+IFVczPjZ3sA7Vkn3GIlucnVUfCub8lnJ1ZtP+taqizIDPQ0ngAchr6ezAqG7ZANfUXyDG2yfA==
X-Received: by 2002:a17:902:cf01:b0:1db:aebd:5e2e with SMTP id i1-20020a170902cf0100b001dbaebd5e2emr14377731plg.28.1708430036655;
        Tue, 20 Feb 2024 03:53:56 -0800 (PST)
Received: from [127.0.0.1] ([106.221.232.187])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902b40900b001d94c709738sm6021665plr.217.2024.02.20.03.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 03:53:56 -0800 (PST)
Date: Tue, 20 Feb 2024 17:23:49 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: zhangwarden@gmail.com
Cc: jikos@kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	live-patching@vger.kernel.org, mbenes@suse.cz, mpdesouza@suse.com,
	pmladek@suse.com, shresthprasad7@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org
Message-ID: <4dc04319-8f4c-4159-a6c8-6b106a15305e@gmail.com>
In-Reply-To: <FD18B42B-6B73-4B55-A9B2-272414531C26@gmail.com>
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <4dc04319-8f4c-4159-a6c8-6b106a15305e@gmail.com>

Looking at the function definition now, I do see that the function returns a struct pointer but for me the compiler still complains about an implicit conversion from int to struct pointer.

Is there any particular reason why this might be happening? I couldn't quite figure it out myself as I am very new to working with the kernel.

Regards,
Shresth
