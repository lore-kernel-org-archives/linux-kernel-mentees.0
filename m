Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0638829
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="LePoEbTT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D26820AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 11:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D26820AB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LePoEbTT
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Li3VOot74KY1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Dec 2023 11:47:30 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE4D182099
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 11:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4D182099
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54cd2281ccbso4698327a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 03:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1702208847; x=1702813647; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmrfVEAYT+EdtX2prQBa70EX5gokQZAuJTytc/ziT1w=;
        b=LePoEbTTemjhRhjeQbLFxZiVvC6/XHgj9UJrbBleCPmxYvx4xgrmlXEoaPPQ8bOpjz
         2DvRO5BTRcEJweSRXfGBFrROexWJtQyPe91bUx5Ntn0aZnrALJHBWI4/qi5bBwSHtlfx
         +QYdxTxDTCKZpU9WpaUzB36BC9G9InUnSpXxJxUXY1sQm3/+Ow+uvJSr9WWRRyvbkkrs
         /raABOwGMM5E3JoB9qOH8lf7Dnj4AjJccwzk4n4XmNyTrJoV5yQ5XPxCptFpHQhAqOV3
         lQc2sIAesWl4MkMnNWGZ7OHFbekAUMHpYgv8ltNiGN7OYTYTUa1p/sXLoatoE+U4kzO+
         vk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702208847; x=1702813647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmrfVEAYT+EdtX2prQBa70EX5gokQZAuJTytc/ziT1w=;
        b=VAdEcHzzNFuw5Un1liz/py/5DWBL3JVzozzpgsTwzV1vazHrEmg57ik18IJMcVPlNM
         OM8gIOSO9M9KTprddw1xXdcOXanrKkkvdyiZo7l0jy81ZlGYyt1OGyIIXXqS05kEwI62
         6neDwwDGVuThmNi6Rq8BUptQhI1VH3J6j7dvRv5O49fUnY1EE1zOwMH8bKTBzj/ZdKLM
         PvwviF+H05PUnF0ZMbsY8Bk1lvOFB2TkqDxZS0zPle8nuPzK4y7h8l0W9lcp32RVnzAO
         C7kzSEZpE1HnltFC7sMNzcJ0mOU2AEvZOXDNe3rnJqb55OmiBc7EePdjzB3J5P4o1wIv
         fbdg==
X-Gm-Message-State: AOJu0YwfQTvjj7ut5VfyFCz1sdzl84N8qkkMbkqIWukSxd0G11WS71LB
	wmEXSVD8mKx1DijXBvVCv3lIPQ==
X-Google-Smtp-Source: AGHT+IFoD8RRDp70KKKn6lToA0tmuSVEYXzOSd7L/BQ2NXHTTAr7bbdfwIUGvOgmM+tXkSjPeZ9+6A==
X-Received: by 2002:a17:907:2cc6:b0:a19:a19b:c713 with SMTP id hg6-20020a1709072cc600b00a19a19bc713mr2270485ejc.99.1702208847489;
        Sun, 10 Dec 2023 03:47:27 -0800 (PST)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id ps3-20020a170906bf4300b00a1dd8945d31sm3319490ejb.34.2023.12.10.03.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 03:47:26 -0800 (PST)
Date: Sun, 10 Dec 2023 12:47:25 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: swarup <swarupkotikalapudi@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v5] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXWlTYyPF0nj1wof@nanopsycho>
References: <20231202123048.1059412-1-swarupkotikalapudi@gmail.com>
 <20231205191944.6738deb7@kernel.org>
 <ZXAoGhUnBFzQxD0f@nanopsycho>
 <20231206080611.4ba32142@kernel.org>
 <ZXNgrTDRd+nFa1Ad@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXNgrTDRd+nFa1Ad@swarup-virtual-machine>

Fri, Dec 08, 2023 at 07:30:05PM CET, swarupkotikalapudi@gmail.com wrote:
>On Wed, Dec 06, 2023 at 08:06:11AM -0800, Jakub Kicinski wrote:
>> On Wed, 6 Dec 2023 08:51:54 +0100 Jiri Pirko wrote:
>> > My "suggested-by" is probably fine as I suggested Swarup to make the patch :)
>> 
>> Ah, I didn't realize, sorry :) Just mine needs to go then.
>
>Hi Jiri,
>
>Please find answer for some quesion from you.
>
>1. I removed the Fixes tag.
>
>2. I removed Jakub's name from Suggested-by tag.
>
>3. I added new line as suggested.
>
>   value: ## or number, is used only if there is a gap or
>   missing attribute just above of any attribute which is not yet filled.    
>
>4. dl-attr-stats has a value 0 as shown below for this reason:
>    name: dl-attr-stats
>    name-prefix: devlink-attr-
>    attributes:
>      - name: stats-rx-packets
>        type: u64
>        value: 0 <-- 0 is added here due to below mentioned reason
>                     but mainly to match order of stats unnamed enum declared in include/uapi/linux/devlink.h

So, by default, it starts with 1?


>      -
>        name: stats-rx-bytes
>        type: u64
>      -
>        name: stats-rx-dropped
>        type: u64
