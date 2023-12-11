Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0833B7A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="f+jqpmQR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB808215E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB808215E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=f+jqpmQR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJMJOMkIyeX5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Dec 2023 12:35:17 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7563A8269C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7563A8269C
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so2734489a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 04:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1702298114; x=1702902914; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=okeZz+/5q28Go+s8k/ynMlYtWODeKp/iZbr3JW3CH84=;
        b=f+jqpmQRBcduxZG7uXcUVdc3DP9pbkS6dvT0IqD5C55A62v70zQOtcp5G27D0i/HoP
         3EcAy6bbnzjGsqgkSb1LVcoZaRhnWcoeHaXv6WhUsw/w7zH6iU+kUEuOP7R9a0yNR9ow
         er5ihLzrQIAhmy4CvXRyPyALmMK5wOQF92zz3ASS9yPDXvcu5GekRF0SNdgm/k+V/vHa
         ZG/jT8LqcUa2uNyhAusp4DIbx08LM6bTNG/Tao9osV9fhsWyvvJBK0Jt7StG5lB7l6xu
         ntB9WlnHOHqGim7VIw/hXz113gn6DIlvdzEibbR9zqIIKWkGnDgIycO3ezwE/0nkpLyq
         KLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702298114; x=1702902914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okeZz+/5q28Go+s8k/ynMlYtWODeKp/iZbr3JW3CH84=;
        b=IXZV1206aJTphxzSj6zDuWIxV6no7eb3e5ORjZ7ogFFL9KkOCT0Zi2Odvs9JaJ/+YC
         sYPInRLBlrneRovsXEjVSnMeS+Lf1Z79QHpatnSm6x9Iq5zMJXIxpGoSak4Hd+E0kOtP
         4uA1x1S/BdnQNB+qe5pwa8pD3uEr+6ehn/T53U+36ANVQKA3z6L2URUAUSfD+t7Lnx/n
         sU/pSRFkzSqJSNr3OgghLyPF6DmrrQQNRNlG/17St4avYxEq4c20MrQnYuKRubxqh+Gs
         2Dw3BL26Qa7pItCxMWPgRXRVCaiyAEFech6Jl0jBiF+dCAMDP/3uGKgo20CYeewz+5xH
         8yKQ==
X-Gm-Message-State: AOJu0Yx3EYXe9By5bTefMvNgjPgxuBgwEVtuPxZYdOfKVOHSHXuGCq1q
	2cerWpoF6A+GrN9jwCwEqib2ww==
X-Google-Smtp-Source: AGHT+IEeNSumf/Z5NdDQ1ZCLP4y0DB4LAifdgyxvXATDzBm3pM14+UCAg7G1tScr8WOo3kRn3GhEgQ==
X-Received: by 2002:a17:906:3519:b0:a00:152a:1ec4 with SMTP id r25-20020a170906351900b00a00152a1ec4mr2373236eja.11.1702298113511;
        Mon, 11 Dec 2023 04:35:13 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id so7-20020a170907390700b00a1f747f762asm4092619ejc.112.2023.12.11.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:35:12 -0800 (PST)
Date: Mon, 11 Dec 2023 13:35:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: swarup <swarupkotikalapudi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v6] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXcB/6tv/kuX4R91@nanopsycho>
References: <20231208182515.1206616-1-swarupkotikalapudi@gmail.com>
 <ZXbaauFOfttLCe78@nanopsycho>
 <ZXb+fRawVUgU+lrX@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXb+fRawVUgU+lrX@swarup-virtual-machine>

Mon, Dec 11, 2023 at 01:20:13PM CET, swarupkotikalapudi@gmail.com wrote:
>esOn Mon, Dec 11, 2023 at 10:46:18AM +0100, Jiri Pirko wrote:
>> Fri, Dec 08, 2023 at 07:25:15PM CET, swarupkotikalapudi@gmail.com wrote:
>> >Add some missing(not all) attributes in devlink.yaml.
>> >
>> >Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
>> >Suggested-by: Jiri Pirko <jiri@resnulli.us>
>> >---
>> >V6:
>> >  - Fix review comments
>> 
>> Would be nice to list what changes you actually did.
>> 
>> Nevertheless, patch looks fine to me.
>> 
>> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
>
>Hi Jiri,
>
>Do you mean in the commit message, i should have listed all the changes?

In the changelog (the line I commented), you should try to describe what
exactly did you change from the last version, so the reviewer knows what
to focus on and what to expect.

>Please clarify, if required i update the commit message.

No, next time.


>
>Thanks,
>Swarup
