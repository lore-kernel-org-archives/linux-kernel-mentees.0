Return-Path: <SRS0=fG7l=4S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19F0C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 20:59:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815E5222C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 20:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="EmjVNr3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815E5222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3D19020034;
	Sun,  1 Mar 2020 20:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1G74nkSdJj1; Sun,  1 Mar 2020 20:59:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C4672002C;
	Sun,  1 Mar 2020 20:59:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D8FC07FE;
	Sun,  1 Mar 2020 20:59:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D07EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 053EC84CE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnyJflQw1l0T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:59:40 +0000 (UTC)
X-Greylist: delayed 00:06:29 by SQLgrey-1.7.6
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1857B84C23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 20:59:40 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id 10so9196826ywv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Mar 2020 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=bDaDpWDzIuINJaeNKQ8LzrSaXL2HTruooBYf7HvA7Eo=;
 b=EmjVNr3XsE6iLfJuQRL0muXdEJAiIyL3Y+jPm6+ePhkA22A4Mz6VWiLTAkLalxBn2v
 utg2WNjmPm0LQ7z4o2gnnDQm4+5FVg4gVvCB6+HNN+089OcaEUUXXzTnsfTX0pkEE24t
 zSVEajAvR7kFRkabfUd9JflyThNgSWvVJHA+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=bDaDpWDzIuINJaeNKQ8LzrSaXL2HTruooBYf7HvA7Eo=;
 b=pRAzWnocH+SB93XdqSHhID/ci8zF1MBWbOc56f1vdBQXvvBJv3LZP2uQq+3m9cmxN7
 KQU3wyHAEN+4OKSW11c9wsfvCe6B4e3lIYI1J65d5uOV6aa4HUGIh+dc72AVzj5yh0x3
 jtsHxK1tUHBBxItlCDHZTj3Kun6U44fsBW6b/EgXZMciiJ5WiXw36bJIlRQptPDAWLsW
 ZZI2VM/diwVMM7/cVlD4Ek18wjGHsb+9xEOsmGwiI6De2lVJXBvDQoU7B4kOGMuI2tlg
 Od50/8rlXsRXeDDzb7vcFsly8sgMXtx8/Fy7c3SZbZR6D89je2kiz8PHo5fRPkl+dblu
 vsHw==
X-Gm-Message-State: APjAAAXBTIQzdxsTGkWfmb8zNuxiIue4Hns3mfkBRWvVCoxv/kdE4tt2
 wGq2rCKWL6BdNjV/rrPRywRW7bOrZ7V2CQ==
X-Google-Smtp-Source: APXvYqx3P8icet9HUO2aeTeE20820x8zQCh6UpI57dcrgc23oibLE9SWZ59F1Ozn7E08XtG9nRgNoQ==
X-Received: by 2002:a81:f10a:: with SMTP id h10mr13376846ywm.109.1583095990710; 
 Sun, 01 Mar 2020 12:53:10 -0800 (PST)
Received: from ?IPv6:2600:1004:b051:ad4e:accd:3cda:58d9:2348?
 ([2600:1004:b051:ad4e:accd:3cda:58d9:2348])
 by smtp.gmail.com with ESMTPSA id c85sm3746327ywb.81.2020.03.01.12.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 12:53:10 -0800 (PST)
Date: Sun, 01 Mar 2020 15:53:07 -0500
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
MIME-Version: 1.0
To: "Rafael J. Wysocki" <rafael@kernel.org>,madhuparnabhowmik10@gmail.com
From: joel@joelfernandes.org
Message-ID: <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
Cc: Len Brown <len.brown@intel.com>, paulmck@kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main:
	Use built-in RCU list checking
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
>On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
>>
>> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> This patch passes the cond argument to list_for_each_entry_rcu()
>> to fix the following false-positive lockdep warnings:
>>
>> [  330.302784] =============================
>> [  330.302789] WARNING: suspicious RCU usage
>> [  330.302796] 5.6.0-rc1+ #5 Not tainted
>> [  330.302801] -----------------------------
>> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
>non-reader section!!
>>
>> [  330.303303] =============================
>> [  330.303307] WARNING: suspicious RCU usage
>> [  330.303311] 5.6.0-rc1+ #5 Not tainted
>> [  330.303315] -----------------------------
>> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
>non-reader section!!
>>
>> [  331.934969] =============================
>> [  331.934971] WARNING: suspicious RCU usage
>> [  331.934973] 5.6.0-rc1+ #5 Not tainted
>> [  331.934975] -----------------------------
>> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
>non-reader section!!
>>
>> [  332.467772] WARNING: suspicious RCU usage
>> [  332.467775] 5.6.0-rc1+ #5 Not tainted
>> [  332.467775] -----------------------------
>> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
>non-reader section!!
>
>I don't see these warnings in the kernels run locally here.
>
>What do you do to get them?
>
>Joel, any comments here?

You have to enable lockdep in your config. Does your setup have that?

Thanks,

- Joel


>
>>
>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> ---
>>  drivers/base/power/main.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
>> index 0e99a760aebd..742c05f3c1e7 100644
>> --- a/drivers/base/power/main.c
>> +++ b/drivers/base/power/main.c
>> @@ -266,7 +266,8 @@ static void dpm_wait_for_suppliers(struct device
>*dev, bool async)
>>          * callbacks freeing the link objects for the links in the
>list we're
>>          * walking.
>>          */
>> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
>> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
>> +                               device_links_read_lock_held())
>>                 if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>>                         dpm_wait(link->supplier, async);
>>
>> @@ -323,7 +324,8 @@ static void dpm_wait_for_consumers(struct device
>*dev, bool async)
>>          * continue instead of trying to continue in parallel with
>its
>>          * unregistration).
>>          */
>> -       list_for_each_entry_rcu(link, &dev->links.consumers, s_node)
>> +       list_for_each_entry_rcu(link, &dev->links.consumers, s_node,
>> +                                device_links_read_lock_held())
>>                 if (READ_ONCE(link->status) != DL_STATE_DORMANT)
>>                         dpm_wait(link->consumer, async);
>>
>> @@ -1235,7 +1237,8 @@ static void dpm_superior_set_must_resume(struct
>device *dev)
>>
>>         idx = device_links_read_lock();
>>
>> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
>> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
>> +                                device_links_read_lock_held())
>>                 link->supplier->power.must_resume = true;
>>
>>         device_links_read_unlock(idx);
>> @@ -1695,7 +1698,8 @@ static void
>dpm_clear_superiors_direct_complete(struct device *dev)
>>
>>         idx = device_links_read_lock();
>>
>> -       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node)
>{
>> +       list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
>> +                                device_links_read_lock_held()) {
>>                 spin_lock_irq(&link->supplier->power.lock);
>>                 link->supplier->power.direct_complete = false;
>>                 spin_unlock_irq(&link->supplier->power.lock);
>> --
>> 2.17.1
>>

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
