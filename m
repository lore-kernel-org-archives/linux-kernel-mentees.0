Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241F8C25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A441E4013B;
	Thu, 26 Oct 2023 15:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A441E4013B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kits9IHL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJ_c8yUiam5D; Thu, 26 Oct 2023 15:38:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8F1EC41A81;
	Thu, 26 Oct 2023 15:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1EC41A81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CFC7C0071;
	Thu, 26 Oct 2023 15:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36F98C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3736F716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C3736F716
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kits9IHL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRFYxJFPIjJA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:37:59 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C3286F662
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3286F662
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6bcdfcde944so237996b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698334679; x=1698939479;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x/ia5iYg44wnoHJ0oC/4cmxCohdGQUTHKCQk0kzxu1E=;
 b=kits9IHLXeYgG5h7P1chglM1JiTrTpjV76eH4q5zrZGs+J7H1XTgvCq6NBTFHCfRgw
 l/D8iExOskJPx/ePYYgBUDj4CU0WOzwvCa2nCcNaYt1gYrXehC76qXfZ+8+ALC59goLY
 SfJgyCssqLNlEmtpySEA+hZ5fGBrhz7V84i7Fsi0c65OTMNE/QIY8oCHDcFbejn/OXAR
 ZtlqdJckwgdaA+BDDf5jaI+HHV9FG82KZIj3VLzNhn2j1AZ+KPjEpzijS1ZM/vZg2WYg
 0zRQ90gFtK1ZrK/7awY4DMzDuB7IK3keZ3/jtrrDr48zJWbDsclUhJsdrAM3H1kfmaUH
 pwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698334679; x=1698939479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x/ia5iYg44wnoHJ0oC/4cmxCohdGQUTHKCQk0kzxu1E=;
 b=slEJ4G3pJHNqUP8iX6fRuRJU+lEgyfz9HV/kj8V4o1WWXFJeez6TDkZFNbc9z9WCeT
 ut5HRkTHrIMUsVeYn4cVCpC17VQy8vLw8v3d+9Sp7mT1TSsa/2kk867MyqCHruu8lGZs
 6eac8wXZf87y1fNNCLCVUYOdO3j6oaxMqEicUjr0Zq9hVWtGilc5IV6s2zRrplSttcsX
 TBxL764YlamJ7zxxRBt05eJB/hLGb7Dlte2UCiapGBtE0Ka78At+nlZ8Y38E8PO+foeq
 cAgISh+2WjBSq4okKhKKOMly698dAt7a9112p5mRKLMyNrma594Y6DeaEUFPs86pXws3
 vo3w==
X-Gm-Message-State: AOJu0Yy9Aw20nxxLEfFzUejFkbb9hdFcVJjlCgZ119BuWRy6jWRRcVvX
 d+d8wlYn1NvKRRWoXf7ymLY=
X-Google-Smtp-Source: AGHT+IEaRvLkf3/LMGsV72caU8fFwJj6ExnROiLmtyAk1A4YB3+0Or2lY9aHpqEzfCqnW39PlEMlBA==
X-Received: by 2002:a62:b518:0:b0:690:c79c:1912 with SMTP id
 y24-20020a62b518000000b00690c79c1912mr18392426pfe.0.1698334678676; 
 Thu, 26 Oct 2023 08:37:58 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 k28-20020aa79d1c000000b006bde2480806sm11399447pfp.47.2023.10.26.08.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 08:37:58 -0700 (PDT)
Message-ID: <dc028fd0-b188-435e-9dc3-f5de53dd9686@gmail.com>
Date: Thu, 26 Oct 2023 21:07:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Mateusz Guzik <mjguzik@gmail.com>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
 <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
 <20231026110925-mutt-send-email-mst@kernel.org>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231026110925-mutt-send-email-mst@kernel.org>
Cc: brauner@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 peterz@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 mathieu.desnoyers@efficios.com, shakeelb@google.com, akpm@linux-foundation.org,
 surenb@google.com, michael.christie@oracle.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/26/23 20:47, Michael S. Tsirkin wrote:
> On Thu, Oct 26, 2023 at 04:06:24PM +0200, Mateusz Guzik wrote:
>> On 10/26/23, Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
>>>> This patch fixes the warning about directly dereferencing a pointer
>>>> tagged with __rcu annotation.
>>>>
>>>> Dereferencing the pointers tagged with __rcu directly should
>>>> always be avoided according to the docs. There is a rcu helper
>>>> functions rcu_dereference(...) to use when dereferencing a __rcu
>>>> pointer. This functions returns the non __rcu tagged pointer which
>>>> can be dereferenced just like a normal pointers.
>>>>
>>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>>
>>> Well yes but these need to be called under rcu_read_lock.
>>> Who does it here?
>>> If no one then maybe you found an actual bug and we need to
>>> fix it not paper over it.
>>>
>>
>> There is no bug here.
>>
>> p is the newly created thread, ->real_cred was initialized just prior
>> to this code and there is nobody to whack the creds from under it.
>>
>> Second bit in the patch changes one real_parent deref, but leaves 2
>> others just above it. Once more no bug since the entire thing happens
>> under tasklist_lock, but the patch should either sort all these cases
>> or none.
Sparse reported 3 similar dereferencing warning this patch contains 2 
fixes for 2, but yeah I should fixed all 3 of them.
>>
>> I think it would help if the submitter had shown warnings they see.
The warning message :- warning: dereference of noderef expression
> 
> Yes, and this must be tested under lockdep, which I think would
> spit out warnings for this patch.
Not sure, but I tested this with sparse (make C=2) and after the above 
changes I dont get the warning.
> 
> What should be used here I'm not sure. IIUC rcu_dereference_protected(p, 1)
> is discouraged now?
> 
Not sure but I read that, rcu_dereference should be prefered when 
reading and rcu_dereference_protected should when writing.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
