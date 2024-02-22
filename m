Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F8924215
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708590951; cv=none; b=TF0fO47OwLGZWRZAcBGpGR7tWgqePkSYkr0JFeO9BFcnbzJlrqH3NUvkJwuUe6hZ1/mjc2VVf0cMF2PEEBEicDNCGDTN2b0E+c2Ef3nmuRvSoi+ImWAAv7NcpYwWZZXdTvYzHY+srhU3d7j4UJ/BiXROQAHHTlnbMlPO77qZtpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708590951; c=relaxed/simple;
	bh=xHwbdjmZSqPrdWn6XHlNXr764e/on4qsQLoM4hWOqrE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=A7WBZ2BgCa7ychrOAV7c+dHt7PeodE63uJ4I6crYJJhC2ovLbW+Vn2X7WCkAYo3kZxh3/AgI4oh/YeVCEmT6PkmqTVjjrmTzJpDbicQiuBoA0AgyyOaK3UO47hu9yi7AyjaT+GCwD5h2usY25AKyQgOzon7tzznmP+dKgwTGiq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TadSTvZA; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TadSTvZA"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D6460B72
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKk2o8QJ5UKM
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 22 Feb 2024 08:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45B116086F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B116086F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TadSTvZA
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 45B116086F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 08:35:48 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d731314e67so55190215ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Feb 2024 00:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708590948; x=1709195748; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHwbdjmZSqPrdWn6XHlNXr764e/on4qsQLoM4hWOqrE=;
        b=TadSTvZApKZ1wFSyiT8Vy2OFL44uQqJp7hnbTmuOkYR5cPlO4Ybxf3kD78OVLky6kf
         c85Hn9z8s5Y18zi8p36umnw/tmShqwHQeKHv+zhhjHthfqXTCNzTAAqPbwK76aOJul5Y
         tW9V+kDfmzB3qqdHn4H7rQ4XWaKugc3roSTGMzh3anL6ysqSqqwFdX9wQLxVRLzPNHy3
         R6F/0M3Xc7v7YuQrqraRRhEp96PbRGefjDF99xV67rePXdJpEKrOuxVToG1lRN5dtekf
         avmsPgVfzVyEf0p9FsAk3B4Trksujt9HGSsAklaFij+F8j9/lkWxBvinXQpug7lSD82P
         F4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708590948; x=1709195748;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xHwbdjmZSqPrdWn6XHlNXr764e/on4qsQLoM4hWOqrE=;
        b=ayjdp/466kGV188Qnas/SDgo/DoZXSv02FA81c8mytY+O7ydjCUhNeFvQtADiqdS+1
         RiIWGx6aqQUNOmvDA3aUHa6At53CUJWD4SEvhUX2AI7N7krH32a51p8mY8IFB0CC6IfM
         GY1mzxToxcIO1iKTWYHWsw5/lOGVnJIzUUyB/tytkkeBCLk+cl77YmKHNY6cCxiwwy8W
         SsW4YF0G9vIroxUhXALEsWph1eW3YSA6V6/m5wyzbqfD53rhkAuEWvNusITcEh2yDBor
         r0KjjkoVwBJLjBjbLWqebZ1vsC3KGDzY8e1JyrJbJvKzvfLkEAwKWYi6zUvStX7dqyp0
         Nn2g==
X-Forwarded-Encrypted: i=1; AJvYcCUyGO8+UMd6RYCDw2dwihuNbHNWealevZJ6IPR5E1gS93TAoyDK1DkABpRd5fnGIgO93R63ow1ZyJu8/a5pSNBkoX+XplpDYraYvlFFYILz6PzMdvZYmzphvvPDKXqk
X-Gm-Message-State: AOJu0YwlfPhTrUdiTqrsfrbMS3Ag7yDVoR8Fh97ofrWYdtHA+MN5GyRN
	RTH+488HE6q/0WdqnRd5xF9kEMplgcUrzOBtsYYtgoY8/uZtbZVQ
X-Google-Smtp-Source: AGHT+IHm40srSL4/lTs5Lqg+0oCFJuyeZcIBshsR0LQDg4eLG87gdBMW8WlA9ifb0M6JsjcbO1sPRA==
X-Received: by 2002:a17:903:124b:b0:1d7:691e:2704 with SMTP id u11-20020a170903124b00b001d7691e2704mr24868491plh.35.1708590948183;
        Thu, 22 Feb 2024 00:35:48 -0800 (PST)
Received: from [127.0.0.1] ([106.221.232.11])
        by smtp.gmail.com with ESMTPSA id jc13-20020a17090325cd00b001db6de983d3sm9421904plb.85.2024.02.22.00.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:35:47 -0800 (PST)
Date: Thu, 22 Feb 2024 14:05:41 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: joe.lawrence@redhat.com
Cc: jikos@kernel.org, jpoimboe@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	live-patching@vger.kernel.org, mbenes@suse.cz, mpdesouza@suse.com,
	nstange@suse.de, pmladek@suse.com, shresthprasad7@gmail.com,
	shuah@kernel.org, skhan@linuxfoundation.org, zhangwarden@gmail.com
Message-ID: <10876e08-a747-4ce7-bdc9-d80b61b3ba54@gmail.com>
In-Reply-To: <88672d5a-1b12-a6f2-bf7b-8670eeddc711@redhat.com>
Subject: Re: [PATCH] Fix implicit cast warning in test_klp_state.c
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <10876e08-a747-4ce7-bdc9-d80b61b3ba54@gmail.com>

That sequence of steps fixed the warnings. Thank you so much!

Regards,
Shresth
