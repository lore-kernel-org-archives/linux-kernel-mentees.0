Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73420468D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939880; cv=none; b=dlFC9tSq46JrtKMjItMwVLusVP35lQzZJEtlEQMriw09mTkvcflTl+7bw3ofJ5vq/v9D3kNbfiw3weTpTNOorGDOMzsijU4ZHnNUZitIQ18S/IpYT0lLaICbh6+edgHdY33mQBNxyf1ocia3vFbs7pVW1tUuZomF6isiP0XV0hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939880; c=relaxed/simple;
	bh=NqCbTnm1d8r8NAcwLbCEavG/3vW5JpCp0c6eGWldrgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5wKZ6UqhjU/DVG7ERBym5FqtnCn94bYQ9mXJIi2UplX4rfCzrd0fBtoG1yeoyI2QTIRBeaZdWv7lwqbc7K7Y+0GtCSlbCqS/5kV7eQCQZYmI6y58/teLwpeSTBxgQneNwAxj6qWf4zauLSYwQb7uMXza7YyEpqg11GChClloHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSoyljba; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSoyljba"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9790640A96
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 19:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugqrm9Be31xM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Aug 2025 19:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B306340826
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B306340826
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MSoyljba
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B306340826
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 19:17:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93c3bac8fso670834366b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 12:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754939876; x=1755544676; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqCbTnm1d8r8NAcwLbCEavG/3vW5JpCp0c6eGWldrgM=;
        b=MSoyljbaweF5PmTndJeQYYTeOnbXnxnrCtdFmkQDdoGG6mFKtThGonoTDRN7vFsXUk
         ntyI/gB+1WdO+pspiE2c8fMEWpjyHc9AUvVyw2gfSWik519McrOg9CziZpOYcDQuG0Zb
         yvlK7VHoCnOJ4DBjEapbVZ7b8p95wKrtI7b61TXx2AYT/DWgCh3oHR+1JtMhJ7Wg1GTk
         xgU2n67fmK/EA2HX284POCwqAAJQSfCsDm0My6my9LX+G51o1SG5e8KrwT5bOvZGsZev
         bu+x6jTF68zlL3d21+pxFJoFx4cMoReLdvKE1v+469M9Wb8pNqoATiaS6JKL4c9K0Pyl
         2XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754939876; x=1755544676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqCbTnm1d8r8NAcwLbCEavG/3vW5JpCp0c6eGWldrgM=;
        b=r8QdFKXDfOh5v6tZIBnRebCTzcTLIEA5z2IeET0vo5qPEEm7sjoxZwZA+VgH0c6hrA
         yqvCVwnJXlJKnJYo0DLMB2THvQY833HcirBx5pXRYcA+AIQqka0spKsbf+6ckwR6lIE1
         BBZKdi/rztri0XiO5uKdTeIZYNR53MJNl4SeqRPN6ptjGpjqlX8T+BAhaIo7fbvKPK+j
         B/kqTcn74FyMiRrEQ7LQi0kUFtgSb+YM0/kr7yuNDkqaPLzY1+Z9ekhYMb2NkPemVVHI
         peuwv/3QLQlR47X8ibSpjosaRdn8eVfaZbI3pM9N6tyWp9Doc2iub8FWFBJHydvMjczV
         tmSw==
X-Forwarded-Encrypted: i=1; AJvYcCXiQorszOtEU7oNJ1NhCd40fsCyxtrqxAJ41bQ63GXif+onmDQ8QfaLNJPPHQUyOe23bF0RAiJ7ueED6zlpLYWfMJDbgQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzwWvqfsNDaXs3xv6zdXjqMqrvvWxVik5FrXBpxEx525o6qWvrW
	Iz3yLrFbzmnNLtqaoXBW/HhuxsoAKIG6P2tyUFDPtbRvJrh9LmMDkCLv4vgHjrv/TuNC2fFij22
	Xpu6pJkZnUOu/2kmzAlPb0riCuIPTYbw=
X-Gm-Gg: ASbGncv76A/Gd4B81RA7l0wRIsRE0b89+9URAzvz4/sRZ17MPA8Gk7uGoZ/FFQTw0Tc
	+hibsJ4OCcFlrJjX42WwXT2BOfiIrF4mxwL7+vqHgX8vczHkXlDFGgGVm2LXUFCcLMG19aBekAl
	HrSRjDJHX7RMCJtksaE77zj6PpKujMirgG/yco8B+B8Mec7ec1kUnTLan9BAaAjuttRfxC9owYF
	eQ6YQD9CQ==
X-Google-Smtp-Source: AGHT+IFvg8MC5VPTI0mMDr3ZjgO1hZC1hJecNIRmoxJEiJKBNdvG9BGTH1cso4p7E/UN4aUaP5ETWA5ERS8g7nlGVtk=
X-Received: by 2002:a17:906:730b:b0:af9:5366:b42c with SMTP id
 a640c23a62f3a-af9c655d50fmr1072472466b.59.1754939875626; Mon, 11 Aug 2025
 12:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811165641.1214347-1-akbansd@gmail.com>
In-Reply-To: <20250811165641.1214347-1-akbansd@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Aug 2025 21:17:18 +0200
X-Gm-Features: Ac12FXzC64AiqIcJl4Ec1rvXpqcZkAusyqNclxgfoE58mv5kghsnOOO9xit8ieE
Message-ID: <CAHp75Vf7r53wQtGWes9WH1UubEjhAju+tN0OORTrkNxgTQPsWw@mail.gmail.com>
Subject: Re: [PATCH v4] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Akshay Bansod <akbansd@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 6:57=E2=80=AFPM Akshay Bansod <akbansd@gmail.com> w=
rote:
>
> Update the sysfs interface for sampling frequency and scale attributes.
> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> and recommended for use in sysfs.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
