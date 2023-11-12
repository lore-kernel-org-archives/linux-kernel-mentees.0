Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523B14294
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X55M2AVS"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38051418E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38051418E3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X55M2AVS
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oorZJK9WZe-4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 20:18:21 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC11418D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC11418D3
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc4d306fe9so4550195ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 12:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820301; x=1700425101; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgzcqveWGXZ8cELOepLq5XS/QVDQlGc8b6jyqXPEG4w=;
        b=X55M2AVSWP/EDu1fdMHbJB4WJA1wgOcZgayYxeP7SaLnVwpV4GfSh3XkSN2MJTGvcM
         UCAU6GklcWm/X8EbruMybockYc3gpgtZCflREnxBvR16qHQxxq6ycMBIujzH9tqThwdu
         AhdM+JZHH25bD/zeiGpEYCCSSvJr+l5z/zXB8TCRzlIUMaj4hDXyfi0scg0+TVyW2p4r
         LRMUOvAEvCXsQeMhdV6b601tMof/ys6dGbb0RHH24OaKq2oNdNF+ue0v6ETjRd3PSOOR
         XGeC0fOqhdysX8oOXDMl0RZvA4frSdV9rDn0D1r7S8rmwZLd4q5iVxfpGKSIVQ5no+wS
         Or+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820301; x=1700425101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgzcqveWGXZ8cELOepLq5XS/QVDQlGc8b6jyqXPEG4w=;
        b=IfwKZCBU0O1Ns2pZ63AMbCp5UdbS9DkkqhlFunj7Ig9wecDiTqBObJ1L1MVni8Xe7V
         N3OjL6lRiXKIoNkA6m9WCXZ4D8Oy5Coq+YFKEQK/PsDQqt2FPFwk6nZaAcXNo/TnRWn4
         6FuQK2uW0dnjyteVkbC+wwk1opdL/6pN+6Fpq/o4LAmCsMD83sNIDegvDsUngwLv6srh
         q3rJeQzYcmTzbdYgEsSAJ8fnTvKuDqLYoGZ7hzl2dg2mHQd+WCh4kZL62J0V6Qvz+rKT
         P+FAPleJhuiGBVOoygMWkJNc6An1Cv//GLVXBJBKvwC0cwxVyNjnb6+GyvL1Lx4rBmEp
         FDmA==
X-Gm-Message-State: AOJu0YwQPF9MbaDb0hZc+JBuOdN39shb0/gnndXeZj9XN0HPYMLCN++N
	+6m76ks7uvhuyvs7IaAsh40=
X-Google-Smtp-Source: AGHT+IGmKldSSZMid9qXjWh8w9COFO8BtH5jlrKeAvaY2WulTkeqttqsFpQntEaFr7AQ2udmWlR7pQ==
X-Received: by 2002:a17:902:db0c:b0:1cc:277f:b4f6 with SMTP id m12-20020a170902db0c00b001cc277fb4f6mr6776508plx.6.1699820300880;
        Sun, 12 Nov 2023 12:18:20 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id z4-20020a170902708400b001c739768214sm2880695plk.92.2023.11.12.12.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 12:18:20 -0800 (PST)
Message-ID: <b6476b5d-5938-45e8-9c3b-14448a5d854f@gmail.com>
Date: Mon, 13 Nov 2023 01:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Fixing directly deferencing a __rcu pointer warning
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com, mjguzik@gmail.com,
 mathieu.desnoyers@efficios.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <202311031320.c3ebc782-oliver.sang@intel.com>
 <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>
 <20231112195839.GA9987@noisy.programming.kicks-ass.net>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231112195839.GA9987@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/23 01:28, Peter Zijlstra wrote:
> On Mon, Nov 13, 2023 at 01:00:55AM +0530, Abhinav Singh wrote:
>> This patch fixes the sparse warning with this message
>> "dereference of noderef expression" , in this context
>> it means about directly dereferencing a pointer tagged
>> with __rcu annotation.
> 
> Please, stop this madness. Just accept that sparse is a stupid tool and
> the code is actually fine.

Thank you for your tine maintainers. Okay I understood that this extra 
patch, is not required. Just one follow up question, in some driver code 
as well I see these warning, might be possible those are real issue.
Can you suggest me like how do I know if a rcu related warning is really 
a issue or just a false positive warning.

Thanks,
Abhinav.
