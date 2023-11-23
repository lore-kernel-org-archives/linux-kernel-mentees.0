Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459AD35F17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X76yXXE8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C308E6134B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 16:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C308E6134B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X76yXXE8
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fwhnOpwUJdQ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 16:04:29 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 943586133C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 16:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943586133C
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5bdfbd69bd5so1554101a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700755469; x=1701360269; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nBMYi0DQuFagtnZx4pcIi3eC9Jxr33rON8i5DT6+5o=;
        b=X76yXXE88dIuEfwDaqTkUQlfaMQKKc8hEre5Yy3fLzLs8l/WJvsyNjOApLVCBGdtBF
         8iAKYkbzdhnX3hCt2wmKTt2utg/Ckhp0K1wPgvRdrSCWOx/YZydL1DRp0Cfv2JMyB6nt
         SzTU0gzG3riqhPCsG95Tajk8ZbR8I2YrqnlgHo6PirOsLDZhR7bseJjtefWkimRHTBdP
         cxhGfmbLblHT/JwReFgNkz2EhATqUwgK+qUVw19Lo1ZnNfReunHSjfaV3f4gCHyxov0z
         tnv5ZclpWFx08su3f6EKLpM2yOVfcjp9ttwruuaGvOsKD+JrsinkTFQpQWaOtNYshNRj
         h2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755469; x=1701360269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nBMYi0DQuFagtnZx4pcIi3eC9Jxr33rON8i5DT6+5o=;
        b=vJ2ltNL9i9hirNjFhqdrXeuQT7ZIgq+UUMB5aX08fxkiQuerdw+PEGoVUO5a1aHsLp
         GG5ABxARr4Ba9bQ/AT/x9wOWu1PcyqdNS1/ynKesrAgSebsPQEXMaKBb/iVg/cfqFNrr
         b+FYtzSHs0I+a+ZUJP3IQ80rGD8M0sqQ4u431PfZh4ebgAfCr0soUE/relxVMNoUAcWg
         sK8i2vqwpvdBxLjbbld9NpW6ssTdKJ64l9yAdN+WXwt2r/IKfMcJReq3S6oaO+7IT01/
         19legil/yOn/4aqB3bGWJNNcXz3HgPUUB1vAO00+/GYE9iusI55I2CmOXF7MxmtU89md
         U9/Q==
X-Gm-Message-State: AOJu0Yw1x6RBorz7EXo23fsoTNGkIOh8WZB7UcmGy7rE/D3W9o5TRjK6
	76LZ5cOUBEWDUR5/UVkVFfQGacnVTnRnaboWTKM=
X-Google-Smtp-Source: AGHT+IELrLprCSfFy6ldKP5CNjX12ykqpJOPuv3JZvYvGdgFBhURFR37CmAyCcv5mXBQTvoPa2KWCe0M2Shro7gi0qs=
X-Received: by 2002:a17:90b:3b51:b0:280:a002:be85 with SMTP id
 ot17-20020a17090b3b5100b00280a002be85mr4198623pjb.20.1700755468832; Thu, 23
 Nov 2023 08:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB0752675D6E0A2D16CE656F8299BAA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <VI1P193MB0752282E559B37F12EB7982599B9A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752282E559B37F12EB7982599B9A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 23 Nov 2023 17:04:17 +0100
Message-ID: <CA+fCnZdTo0giqBjukHYpwjGL97NnVtmenHkg1YBi1Su+DoZf4g@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: Improve free meta storage in Generic KASAN
To: Juntong Deng <juntong.deng@outlook.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 11:43=E2=80=AFAM Juntong Deng <juntong.deng@outlook=
.com> wrote:
>
> Can someone help to apply the new version of the patch to linux-next?
> to replace the buggy version of the patch.

It should appear there naturally once Andrew picks it up into the mm
tree. It's the holiday time right now, so I would expect this will
happen in a few days.
