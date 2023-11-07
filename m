Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C172A1C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AFDAnSTs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02C1060BD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C1060BD8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=AFDAnSTs
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYzCV8-BtRMh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  7 Nov 2023 21:23:36 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B8E160BA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Nov 2023 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B8E160BA2
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7a9541c9b2aso50446439f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 13:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699392215; x=1699997015; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtzi+TszAqVWEZJQWIHSFO/HSHZJHi2BvQ12spn5fho=;
        b=AFDAnSTscftP29MfdHkz9UtIK4OrnKu2005+drzWAZBxYmP69FxIPuUY0y4pHwiN5Z
         47ZZT+IWztFpFyYmW/Pgfb/JV1mjHnmvWO4BfPhwrQD4iIEx6nHCOqA1GTqFMMkGtixz
         shio3fY5nA2ldY11bvvGKIRj9jLlpQWrf87+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392215; x=1699997015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtzi+TszAqVWEZJQWIHSFO/HSHZJHi2BvQ12spn5fho=;
        b=PDpauQpFyP8Zd4ApBzCra/59s1BsXjLAGHmkM5MzHq48Rxp6RAKVIGFJZMqbNm19mM
         SlxRCEH57b4ZGxpkAmvaBRtec8z4RfMjtv1gBbXf7wL+HKTBtvHjzDl1yUWonCOnKdu5
         2X9LQzJQ83crEB/Smfvg5kJqwADu6yhdsTg8Cz1jpHehTwB9tSN6hyKSc0rCTn0jGv0y
         vNpjwDgbOwnv7vNSff1YuTC/P1CfnWbyCRMq6JPDWpSX050VJazI1WlK27BGypYUnpP8
         9+iBGoC5JwIOuLtSJFySfoWr2TNkUCO3vbPTaBRz5jAoYG6+nV8MQrzdk5KQwzq90ds1
         e+6g==
X-Gm-Message-State: AOJu0YzsaDsrcYOglCh/6BWNjvQztkPyU9/DpxAeQw9zGkRQPzHjAJz7
	dX0wXBYvyXY+EFnOsRaIhOc5wYjo
X-Google-Smtp-Source: AGHT+IFUJw2/d40v1RpVWENnkltY7sbFKy+YRt8lL1zimhATc9h6LLV6++VkRY9Dgw1ERsUTIleVdw==
X-Received: by 2002:a5d:8ad7:0:b0:7ad:3ee0:86fc with SMTP id e23-20020a5d8ad7000000b007ad3ee086fcmr80165iot.1.1699392215338;
        Tue, 07 Nov 2023 13:23:35 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id gq10-20020a0566382d0a00b00458edc46632sm2883067jab.156.2023.11.07.13.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:23:34 -0800 (PST)
Message-ID: <0f3a63ff-cbf9-4e06-8f4f-fd22bafa26fe@linuxfoundation.org>
Date: Tue, 7 Nov 2023 14:23:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: capabilities: namespace create varies for root
 and normal user
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/23 06:53, Swarup Laxman Kotiaklapudi wrote:
> Change namespace creation for root and non-root
> user differently in create_and_enter_ns() function
> 

Sorry for the delay on reviewing this.

Can you tell me more about why this change is needed and
include it in the change log.

thanks,
-- Shuah
