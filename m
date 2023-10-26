Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17CC25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63B5B42C25;
	Thu, 26 Oct 2023 15:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B5B42C25
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=N3P/Hydj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx8_7MArO4V9; Thu, 26 Oct 2023 15:01:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3A65D428D2;
	Thu, 26 Oct 2023 15:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A65D428D2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7E4C0039;
	Thu, 26 Oct 2023 15:01:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B3DBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB3C7838FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB3C7838FB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com
 header.a=rsa-sha256 header.s=smtpout1 header.b=N3P/Hydj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjTlBJfwV_wz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:01:23 +0000 (UTC)
X-Greylist: delayed 599 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Oct 2023 15:01:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960988386F
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 960988386F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
 s=smtpout1; t=1698331882;
 bh=zCxTGeta7j9+1MvbeHs0ufQDzrEJIbaDrDa1lovi73Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N3P/HydjL1+T6To9o5YEwM0iMpG0Rm+7WPyrd2xKnKLLbuXBLpSPzECFGmtYy6VS4
 Nr7qxaf2Hyq8573FyuW4FXWFCUUnaKjvtt0DqJ4PSgsfSldgKjTHGhDgxnnIKKcSB+
 iSI2JZKAolprbzP7y+esbYx3ITCwrGpB/czXIdu0MXOaeQkRRwaybPvuDbcz0rq6/u
 M70IBI/CzkgOd0UoNpjXk4nAh5qy4b9s/P2EPlwglsAwtERm4Nokm8IYYR0AMCLPKi
 wuqPt8LfVF623INmssMMXgAYhYw7aYcn4+Zs3fDRCHnXAJlLfdv/we5cmIa51ULraD
 EHNE8vH2731Aw==
Received: from [172.16.0.85] (192-222-143-198.qc.cable.ebox.net
 [192.222.143.198])
 by smtpout.efficios.com (Postfix) with ESMTPSA id 4SGTJV2N6Vz1ZXJ;
 Thu, 26 Oct 2023 10:51:22 -0400 (EDT)
Message-ID: <b0654dab-eb43-444e-a820-db169812e1ba@efficios.com>
Date: Thu, 26 Oct 2023 10:51:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Content-Language: en-US
To: Mateusz Guzik <mjguzik@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
 <20231026091222-mutt-send-email-mst@kernel.org>
 <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <CAGudoHFXH_FDgKRaJvVgQ3W8wD2TC=8yhiNm1NECApnQ-CNAZQ@mail.gmail.com>
Cc: brauner@kernel.org, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, Abhinav Singh <singhabhinav9051571833@gmail.com>,
 shakeelb@google.com, akpm@linux-foundation.org, surenb@google.com,
 michael.christie@oracle.com
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

On 2023-10-26 10:06, Mateusz Guzik wrote:
> On 10/26/23, Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
>>> This patch fixes the warning about directly dereferencing a pointer
>>> tagged with __rcu annotation.
>>>
>>> Dereferencing the pointers tagged with __rcu directly should
>>> always be avoided according to the docs. There is a rcu helper
>>> functions rcu_dereference(...) to use when dereferencing a __rcu
>>> pointer. This functions returns the non __rcu tagged pointer which
>>> can be dereferenced just like a normal pointers.
>>>
>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>
>> Well yes but these need to be called under rcu_read_lock.
>> Who does it here?
>> If no one then maybe you found an actual bug and we need to
>> fix it not paper over it.
>>
> 
> There is no bug here.
> 
> p is the newly created thread, ->real_cred was initialized just prior
> to this code and there is nobody to whack the creds from under it.
> 
> Second bit in the patch changes one real_parent deref, but leaves 2
> others just above it. Once more no bug since the entire thing happens
> under tasklist_lock, but the patch should either sort all these cases
> or none.

Drive-by comment: perhaps use rcu_dereference_protected() ?

Thanks,

Mathieu

> 
> I think it would help if the submitter had shown warnings they see.
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
