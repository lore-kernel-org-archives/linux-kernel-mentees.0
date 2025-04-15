Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46F2DFA36
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729325; cv=none; b=ZDLh8u3mK8ZxAfdf2QO419bqWTKxQiTQvlpt+VRmDtZMnqH5GPyGck84rgyZ+djqYHaMEdGpDcwEGA2qKF8JJHqMV/AKcTzWjx+9ut5FCV7kZQt4GNI6hs+foJqUexk3/6DdnjfVy0pwz1wZGXxg9bf3g0/6oKaEvDZwDJPOkTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729325; c=relaxed/simple;
	bh=GsenEpf9zvk5P2NHlMMGuoKKYYE9yPtrUU9/iOPSsZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtYokKqgWfOIzwftRKtBqAA+jHJBgPZVHx79Sn1O4JA11Pzg21HpgJvSXeZIw0S6sI/ryczIcDfJ+I7S91ijhKNcrSYz3BAamGIThokNqsM8+ukA+GZ7WcSlE9DphwfIQFsGnV1gwoFEmgX6Neo2o0oMsh/cKC0NZJ0oyz0tcGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncbf+bEM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncbf+bEM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3F74128A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 15:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nf8IqVu10W96 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Apr 2025 15:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B405A4129F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B405A4129F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ncbf+bEM
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B405A4129F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 15:02:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfe574976so39305395e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744729322; x=1745334122; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsenEpf9zvk5P2NHlMMGuoKKYYE9yPtrUU9/iOPSsZw=;
        b=Ncbf+bEMWvVRB2dRT8TnncKYf+oqRw3LK0bhoqI5KayQTb2In3ZLbHg7G1oG0Lh7k3
         eCWu1TT4jXqDDRI/m8CnuUDb9fChihR7FJW3AUyDfUSmzmWy6ZsBJoMJSm4nlEIWmGFv
         f1ZTIYYL8H+kY0VdNLhqGic20t5zAeiBztO2DX5MsX/duzakJHexDFuJ5ljJQ0+QST3O
         uxtRSxFJcijFOBMTkPRm6LiXYPVAKRo2IC54NWWwuU/FAHE3JOJ1mRo0FDQxa50MRmW8
         46m2UlQEagQ2n+UVWIy3+PoPyM9TBjvMMSaChWHwU3ZT7Yj0lPs+AsgVYLiaQGsfSYd0
         VZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729322; x=1745334122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsenEpf9zvk5P2NHlMMGuoKKYYE9yPtrUU9/iOPSsZw=;
        b=XHteKGs8k+o6fSA4HPGgLFCdWQ9jzooz+pvbyxa2KDJVzRLCjwWUWrtnhB5tUFFyV8
         KQCBqa3A+8vj73a072cgKS/7KOtyZtEm+CE9LFLysFPfceFrhmtgACAG1dJOcEKJC637
         Oe/pjs0Ul8ZROZvzgDf6f3d3SSLafhB3iMuk8q9dolvpFOCq+pAIMql+lDadwlLPZD/w
         eCsqE8Day24WJYzp/plriiIMnlfvlgINHIpKLt3x+3IdhK45arMN5//lxQIaVJtxfZlm
         yEws4ZDvbP3iExZRUDnFINH9Rv8Nw7MAYGJxFL77/3EFXK0ETof3FTJO+PFpFVRdX7yy
         mzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPWFGZ1BeTL5ZDhl7iX6Kk4A/yznT6Tf7tz/ZniI109OKPQSOCWaue7eziQqRzjO7SnpCXwIKWv31nYFjn1nBViPedDQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy9HjRNbSDHbR4T1NvLR4z/OP2J1RRofpQ+iY5RQop9nudTfqQy
	+6bFv1zQ4sWpq9DhmT91Z0UhpZRCsAoDcnCKtKrRZHJ44Hlfv0THNt0onnac1MyIhhFwCqaFUaU
	Bv9GPhOreJsYnjOHJk3Hz/Lalz98=
X-Gm-Gg: ASbGncvHNigM7hCmS7f+qKxOn5zVOXSS8M1qpyMO6aWQ2hl8kWyj4w1CPqojILXuhOj
	rsaCX6NUKxjaJ3Ei8GphA6zrKlxBlM95MdSyRxUDxqNFkH3u9olaO0edxy/qHq5baIjgHzC2y5b
	+O/g4+4IIFS4KKae7Isk81dkYKOjDGKiKXw4BV
X-Google-Smtp-Source: AGHT+IEEhlDJ89C3taeDQubyKWfbYArOMdjq8xhOrlVTpBQsoWre14ibe31rWsDsbwAwV9z2K2Ku82lM0PdbZnwrGCM=
X-Received: by 2002:a05:600c:502a:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-43f3a9a70famr126994785e9.26.1744729321032; Tue, 15 Apr 2025
 08:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415130910.2326537-1-devaanshk840@gmail.com>
 <2025041517-semicolon-aloft-9910@gregkh> <CA+RTe_hfdgPTwVX_pizHVnsDDFJoEOQD=dH3KuBXuDbycU0yXQ@mail.gmail.com>
In-Reply-To: <CA+RTe_hfdgPTwVX_pizHVnsDDFJoEOQD=dH3KuBXuDbycU0yXQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Apr 2025 08:01:49 -0700
X-Gm-Features: ATxdqUGwfpjQ3TEoIluDDdRzEK7VnkQJBv8D-i6PQJaXxr2L8ySLffMkEFa_6W4
Message-ID: <CAADnVQK=z2eWgcH2duiwkkVC-4RctPVZ+fqdC9KYiV7HUy0i8g@mail.gmail.com>
Subject: Re: [PATCH] bpf: Remove tracing program restriction on map types
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	stable <stable@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:25=E2=80=AFAM Devaansh Kumar <devaanshk840@gmail.=
com> wrote:
>
> On Tue, 15 Apr 2025 at 18:49, Greg KH <gregkh@linuxfoundation.org> wrote:
> > what kernel tree(s) is this for?
>
> This backport is for v5.15.y stable version. My bad, I should have
> mentioned it in the subject.

Nack.

5.15 doesn't have bpf_mem_alloc.
This backport makes no sense.
