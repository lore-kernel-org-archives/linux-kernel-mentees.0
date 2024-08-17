Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE346BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 Aug 2024 00:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723854659; cv=none; b=QR9rOMJHT8T/hi6zRMe2WTUykKd+gvQXw4BMzE7HouPiZebPZzCIbsCzBP20BUm1fe0+fxQuAAtvDkXI+lYHfhEVjKH+QjDIuLn6bykxqzS3bdd2krhxVofXfubwgS+eJyVR2jIPvrKB/yN9PvxcCBtgfwtUmllgJllnW42LmjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723854659; c=relaxed/simple;
	bh=F5aspppFrEtEePh9CnIr/vLJ3B5tE+uRZgfVD9WFVBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0RG1WTIlXvZO0Ju7EQPvBfo5HaXOq+uMmrVa2xwrOyc6/BW0TlWdZQ7ZkALVjyzCUYrCmxEhjgh8CbUEgtusqvkgpPNxxNJ+W7Kjwa/WJ7Vj9xBSk0tPWyu9u9AgwNKyiWLRholNbQ00+MTRujhEiBBID5mwggw3lgbBJFgQY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYPiW8Nq; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYPiW8Nq"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7387C40B3E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 Aug 2024 00:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AC9ooR4Stf-q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Aug 2024 00:30:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=linkinjeon@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 983EA409F1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983EA409F1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jYPiW8Nq
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 983EA409F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 Aug 2024 00:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EB6F6232F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 Aug 2024 00:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039F9C4AF10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 Aug 2024 00:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723854655;
	bh=F5aspppFrEtEePh9CnIr/vLJ3B5tE+uRZgfVD9WFVBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jYPiW8Nq+BRitUI9AkFnkpClYFna480NX7wsxlmcEjcHWNrr1aB8VMHIFKSL2zXwx
	 Uo8BN78lpbCzJrYpuHg46IjUW9HtqO0VAezh3MzL06uwt5/g8JJCY2WOjhD91v8qxS
	 MK93PaCGE9diRFK4ci+FC+jkvz1Xi0czvztZvUc8ldikKeuorcGhQzp0NLx9iVl3lT
	 WSz7kLj6AVBNTYdNO2RDhp6b5iUIH40dYH4hdHqdV2UMxBQWxCwM0GadtZPkkrZCau
	 3nb3YJpNrVvQ9UwoGCeRJfCGYzxFT3ig++rhbA2QKGyn3oXqHlneQQDw8zZJzRKWgy
	 QveOjai0o8FWA==
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db18102406so1432828b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 17:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9RCGdLLIb08Qgv4NpPdjiXJWvq/IbQXU/xJrIKL7wumyzPVUW5LFLxeeKCjvG6Q/vE14sfITZWxZWt8YY71XjSZD+f2aW+89NTIXiCah6J8PDCAMkgTekJyXDdAWF
X-Gm-Message-State: AOJu0Yxcj3rDOh6OvwULDvAiILqC8GTnGO49di3jHyYTzAOWv6dcYGDf
	GO9M6gGiThZYbNrEeP/8GJ0qzA8ZfWPTpSmuC+Z7LyoOKl50Ofm6NJZWvFaHszcY3+7JIMTYzY9
	iU7UEJfnd3o6tBMzR1iIVrvNcY2E=
X-Google-Smtp-Source: AGHT+IHHRnHezftEcv3s3ZnckNZuMCCVxWJhwhlH67g9+rkY/1D5CiBCtMsyGUTzWWm7MOGnfq7OZTFosvxHhZwoIOM=
X-Received: by 2002:a05:6870:2183:b0:260:f9e4:1fc with SMTP id
 586e51a60fabf-2701c3a1c26mr5056307fac.20.1723854654316; Fri, 16 Aug 2024
 17:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816192452.38211-1-victor@vtimothy.com>
In-Reply-To: <20240816192452.38211-1-victor@vtimothy.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 17 Aug 2024 09:30:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-W=3kgGgWccAOUNS9nwuJ5PErp9jPudJSZzDu83=B9=g@mail.gmail.com>
Message-ID: <CAKYAXd-W=3kgGgWccAOUNS9nwuJ5PErp9jPudJSZzDu83=B9=g@mail.gmail.com>
Subject: Re: [PATCH] ksmdb: fix spelling mistakes in documentation
To: Victor Timofei <victor@vtimothy.com>
Cc: sfrench@samba.org, corbet@lwn.net, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

>
> There are a couple of spelling mistakes in the documentation. This patch
> fixes them.
>
> Signed-off-by: Victor Timofei <victor@vtimothy.com>
Applied it to #ksmbd-for-next-next.
Thanks!
