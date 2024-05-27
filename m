Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81C4EB55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816111; cv=none; b=ObVnNsR4SFxnjkBUNkkjTLXBmZ1jzGg14r2BV6cUtht4K7GaZx8jDbj7b0bd8CBYEssLqyM1u9QOn5mElOqaY6yQJtn2y/0hK4MQj0jtZVGjgxGKo1iFJZjApjY4w9PnmnUxbMhPfE5F6S+H2hUecz/xOrD7Wj+esEuUU8+MJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816111; c=relaxed/simple;
	bh=LhIMyM7Q1PMo3Lw0qt2I3zHR0JcJLpGAUAcCqpa58+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTeBRIb7jnnSDnF75L/7renWyEH0jp0YjTTV/wwtSBEH/a8qUDjMbFD4PZFNehX0pbiRLFX6CjD1hcEWo1oX6dpQrHnkyRUiNwbuKDMMTvxct/B525Nj+7QN7KBwXTUh/BOoGoGLqmCXch4sQNfvsJyusACrgpolUY9P2rGGJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGAmWCF9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGAmWCF9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6CD381CC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RZlh2F5JPRx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 May 2024 13:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E79F981CAD
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79F981CAD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cGAmWCF9
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E79F981CAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 13:21:48 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f47784a2adso9035675ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716816108; x=1717420908; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csiiP32o7V0QfgwfDEwBkwjUhpQOhY+JNgQcN0UEYPc=;
        b=cGAmWCF9GGungs3x5cDBOrhvaiFuumeL5GZs8DASfuwh5l0ZPevKEy90ioQtMqn7dc
         jQizpAr79wRdevlFn7hiXv4Td3a4QXt24ebmAIQwO0aXj9QEmd6whD7yWqEI8W/Xu5UR
         GopqC5KopgLcpGEaF79foO3agOcUy8X2KkWLmJHJi2evEmYD8Fz066ISq0S5OjB4cPI0
         e2bK9AVsRQWbdyDiBKedpMCHrgwkFmxUXOXRu7X75HK5rJ0V9/NTi37fg8EV4dLtKdEJ
         3phcquDy5XgSmTnscJlRLbghVDw4Ri/gQBcSnbCJEcP66sHkEYFGiHczQCwI7Ml1Oqun
         vLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816108; x=1717420908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csiiP32o7V0QfgwfDEwBkwjUhpQOhY+JNgQcN0UEYPc=;
        b=peNA6a8YR0aKmfIuhqwiknFdBai1uBs6LMgy0doiyZe0uOF6YTPqPij+T/23FzuPH/
         I82JfjbjxPqGfx1RdOJwvwzkQvvpD2jM2QeCJ4JKwDtEhZgXuKzfRJSmu2scnoeVrWpL
         C9jA3NnyGwoseeBAVzThrS2KcayGt/pvcUOt49fQXR8bV0NiWK/A8LCSF+8a7GI+rzha
         O0t9LfEHn3JCYL3WqKGgAwnZw3RnJQnHCnk/SBKhQC7DR4W9lhWyxPudWNgMR1PRz4bs
         drTHVRljAqtkXVpDLD5adEsxD4b+x0kVsLHa6AXfGwImavhGQV3YEnbjmeijR5LMscs6
         VNew==
X-Forwarded-Encrypted: i=1; AJvYcCXd/Lq9FoSxWu4pSnh1eo9IQnfv1LIt7v+Y0prsEk4PjazMqrC2EM3tR994Eqfq1WdKjSI9I0y3CmVcP6tcvXDaO6GYIUbJ0TlrafYMf6CJdcJQjQvy+R4opVuoDhbY
X-Gm-Message-State: AOJu0YwmqV20LsPpC9sGbWeg5iPMoyITc7TS5W3uNDuNcfTz7U7nHMup
	Ki1ke6XNe1CnPWlK4VMYM5HY3QxuLUOXfxiG8l9TvZ30IWsYC+V3
X-Google-Smtp-Source: AGHT+IECc6I+wxeOCmvUlz/sds6+InCkcpa/gLRp/BqLxWTt9sf2LZk9n0dHEAlhEO+pxx48Q3Wirw==
X-Received: by 2002:a17:902:cec1:b0:1f4:8e6d:6efc with SMTP id d9443c01a7336-1f48e6d7307mr44291085ad.5.1716816108025;
        Mon, 27 May 2024 06:21:48 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c967925sm60465375ad.168.2024.05.27.06.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 06:21:47 -0700 (PDT)
Message-ID: <bf37bf39-32d3-457f-abd6-115215d631af@gmail.com>
Date: Mon, 27 May 2024 22:21:44 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: cve Korean translation
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Jinwoo Park <pmnxis@gmail.com>,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240527103003.29318-1-yskelg@gmail.com>
 <87ikyzpgqz.fsf@meer.lwn.net>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <87ikyzpgqz.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/27/24 9:43 오후, Jonathan Corbet wrote:
> yskelg@gmail.com writes:
> 
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> This is a Documentation/process/cve korean version.
> 
> Thank you for working to improve our documentation.  A couple of
> questions, though:

Hi Jonathan, Thank you for the review.

>> Reviewed-by: Jinwoo Park <pmnxis@gmail.com>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> 
> 1) Why do I have three versions of it in my mailbox, sent over a period
>    of 13 minutes?  What changed between the versions?

Sorry, I forgot the name of the reviewer when I first sent the
documentation content related patch version 2.

>    Normally, you want to wait for reviews to come in on one version
>    before posting the next, and you should put a comment after the "---"
>    line saying what changed.
> 
> 2) When did this review from Jinwoo Park happen?  I was not copied on
>    that.
> Thanks,
> 
> jon

Thank you for your comment.

I have updated the content from version 2 to version 1 from
Jinwoo's review.

In version 3, I added the name of the reviewer I forgot in version 2.

> ---
>  .../translations/ko_KR/process/cve.rst        | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/translations/ko_KR/process/cve.rst
>
> diff --git a/Documentation/translations/ko_KR/process/cve.rst
b/Documentation/translations/ko_KR/process/cve.rst
> new file mode 100644
> index 000000000000..9daacba8d445
> --- /dev/null
> +++ b/Documentation/translations/ko_KR/process/cve.rst
> @@ -0,0 +1,108 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:원문: Documentation/process/cve.rst
> +:역자: 김윤성 <yskelg@gmail.com>

I added Jinwoo's name here on version 3.

> +:감수: 박진우 <pmnxis@gmail.com>

Warm Regards,

Yunseong Kim
