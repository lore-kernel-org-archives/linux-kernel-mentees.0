Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433ADC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:41:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04DC32065F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:41:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP7CW5tA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04DC32065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CABDE2E8A7;
	Fri, 10 Jul 2020 22:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2d2yQbt0H3jp; Fri, 10 Jul 2020 22:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E8BB226F06;
	Fri, 10 Jul 2020 22:41:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D140AC077B;
	Fri, 10 Jul 2020 22:41:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86F2FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C6EA88B2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nP_Qf09HUYkL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:41:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1464E88B29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:41:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z13so7370797wrw.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HEbLwZa+8AgiE1sTsi+5dmebuA2XCkZOdthvMWC9zb4=;
 b=KP7CW5tAuKK2GLWkOhXixaxYhsLkIgmqDx373gqHEaQImwUaqRQCypSp6iHYmH9Jtd
 1YXpx2tazlWq7QgppjaERv9NSIQMi005ctyW41gNTMGdmjf4+Fpdpi0i5y2aYuihHJFM
 I97j0UWfMjdaU0Xg2oqh5NzPfVGg7kFrEs9rJlx7D6ndUaAGAjhi1B+TYoxoQKDKMnho
 mX7dXuGi60EQwiyEnS7h2ZXy5vH6Ne+JSKe0sRQeqCCEvA+RszvUurijLoujOUczcR/F
 47QYFii59lD9xEiJ0fp2UKvOi7jIXW4Fh8myLQ2gvqieINF6Vk+0nFpvF1YxE8lHYvrj
 BNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HEbLwZa+8AgiE1sTsi+5dmebuA2XCkZOdthvMWC9zb4=;
 b=BDCm6DEJKpcm1vEyB36d1040GqVJy0/zRyEpyhq8GIDaZic4c/oqYd+HNgZT+AEAXW
 eZJqvR+mStG6RVGu6DM7M4xDXRw/YXdEVyum8Nx3MUhSt0KQhQlqc3NrYRa0hq0NWRfw
 s/LQpNqzbXCd1Nxi0JrhsrdZ1A7BhmBP1ef0N5smrRbUGKrVhKEmmflWJ9MTe0morJIV
 Sf+IH98qQhDQ+tgJhV1izJ+pHs1R7hHN/YWCIdVEK4y3RdkQ26XbWxj/hzDhl6svIBoN
 4u/T2KYQvCbE0ykX/cMqF2xWoiC8NoxJicu4MvEoepig4CU8+y3/1ZTJRJfm0Y+/iFEp
 aDuQ==
X-Gm-Message-State: AOAM533e4AvrigRa851Wmrdo/nHtrILccuZF60Xl4w1JPDCXhbhzZE6F
 GG8TPsuo+q8v56LeW/qTudU=
X-Google-Smtp-Source: ABdhPJzFJUGBCPAOYmLYSDS91PNlB5l/NXZG/EQGYdtnFen+q7UFpF7WUfEaLVIXb9q4EI1/CogbAQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr68475674wrn.408.1594420908598; 
 Fri, 10 Jul 2020 15:41:48 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id c25sm10626843wml.18.2020.07.10.15.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 15:41:48 -0700 (PDT)
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20200710001406.GA30420@bjorn-Precision-5520>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <ee4e0e13-baed-9800-8ff7-a91186bf1f8a@gmail.com>
Date: Fri, 10 Jul 2020 23:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200710001406.GA30420@bjorn-Precision-5520>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 5/11 RFC] PCI: pciehp: Make
	"Power On" the default
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


On 7/10/20 2:14 AM, Bjorn Helgaas wrote:
> On Mon, Jul 06, 2020 at 11:31:15AM +0200, Saheed Olayemi Bolarinwa wrote:
>> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
>>
>> The default case of the switch statement is redundant since
>> PCI_EXP_SLTCTL_PCC is only a single bit. pcie_capability_read_word()
>> currently causes "On" value to be set if it fails. Patch 11/11
>> changes the behaviour of pcie_capability_read_word() so on falure the
>> "Off" value will be set.
> s/falure/failure/
>
> Split this into two patches.  The removal of the default case should
> be in its own patch to make it trivial to review.
>
Thank you for the review. It is now split into two in the version 3 
which I just sent.

- Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
