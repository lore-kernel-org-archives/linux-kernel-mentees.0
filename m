Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0E1CA90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="bqLWN397"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5DF81EBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5DF81EBB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bqLWN397
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqvr72iojhll
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 11:40:32 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 33A4081EA6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33A4081EA6
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso655376566b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 03:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1699875630; x=1700480430; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcfo06z3VKyoxsYU8zgKDhKubrv1hrF7Xmq5SMl2yWI=;
        b=bqLWN397/uK530FPsUiYkQjtpD/l4XCMgVbwe95U7aF+kEV38XgDsspUxk6vs+Rh56
         qqkTQQss7yizJfjIPxnLxFjAbM4aHZGb1YXIN+xvoWXdsy1QCrbUv66cjflf4musPY9z
         1B9nd6vxUgFIjUw9yv7y4zy9dl8g98dlThWZDtf3v/Q6nnLeIHcrCOzG60rVUe52m8+u
         xnpugkeJeqFZEfF5Qaw53CDCoWSJ9Xj3C+72YNKz25MnhsegYWwSeTOWzIcgz26xynnM
         9AyF3Pc022pwVrHFfMr3WVD/yNeZo/ngjzMiee1OS0UKDmPd2OVBw/zqpFNledLdp/QL
         MOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699875630; x=1700480430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcfo06z3VKyoxsYU8zgKDhKubrv1hrF7Xmq5SMl2yWI=;
        b=tpE5yxR/ngkfyVyRBWC7uKWivqjoXiJ/yoFUTZcxSRPZ/PAJxLxXCguCFgJTz0dFVH
         P/cvVc1MubC+iKSmygNcQ2h/7R9waTLhZhfBSbjw6OC04Ya6jMl7XhjOuEG/pK+wewXW
         1WdrhdPbJbEoTu1qRbIewGoa5pOmOMiB+i7YoRxWkY4XnFezOweWAhZdngq5HggQcGXA
         FepDCIvfkjGMO2rFlbExm8NKnEHSL5RuiXhzOdmxvdM6nYiarCtpX7UumdWwFmvimmgu
         /GuiOnYXPncQ9kPBgsjoSgbbu1OyX426ym2WyxivfK7HHYDzdBKBshwvO2AaTU5FfJCg
         euhA==
X-Gm-Message-State: AOJu0Yz58qQHAeCUUvToYL9EA4AvV5hslzMdcfD3JK3gTzZfCi7vXNhA
	bX8IYuvRdTEXx8nb9nSNU8VQpA==
X-Google-Smtp-Source: AGHT+IEBT3TFb3SwcXqFbW5/DCGX2SiAFfB/PjNEjF50lkStEsyUZV4qdakXeb7JCvQ3WqOAXHThQQ==
X-Received: by 2002:a17:906:793:b0:9b2:c583:cd71 with SMTP id l19-20020a170906079300b009b2c583cd71mr4538349ejc.50.1699875629620;
        Mon, 13 Nov 2023 03:40:29 -0800 (PST)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id se10-20020a170906ce4a00b0099cce6f7d50sm3928489ejb.64.2023.11.13.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:40:29 -0800 (PST)
Date: Mon, 13 Nov 2023 12:40:28 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] netlink: specs: devlink: add missing attributes in
 devlink.yaml and re-generate the related code
Message-ID: <ZVILLK480K6Go2wN@nanopsycho>
References: <20231112092352.20072-1-swarupkotikalapudi@gmail.com>
 <20231112124648.2e11ec25@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112124648.2e11ec25@kernel.org>

Sun, Nov 12, 2023 at 09:46:48PM CET, kuba@kernel.org wrote:
>On Sun, 12 Nov 2023 14:53:52 +0530 Swarup Laxman Kotiaklapudi wrote:
>> Add missing attributes in devlink.yaml.
>
>For merging you'll need to repost CCing netdev@

scripts/get_maintainer.pl is a friend.
