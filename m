Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6D6C4BA06
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 08:55:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D311924688
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 08:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D311924688
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=darmarit.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A13DB876F7;
	Thu, 27 Feb 2020 08:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNyBhTstSPF6; Thu, 27 Feb 2020 08:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A16248761D;
	Thu, 27 Feb 2020 08:55:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 965C0C08A0;
	Thu, 27 Feb 2020 08:55:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF893C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8C5EB20448
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzforNX7vYmO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:55:21 +0000 (UTC)
X-Greylist: delayed 00:07:31 by SQLgrey-1.7.6
Received: from smtp2.goneo.de (smtp2.goneo.de [85.220.129.33])
 by silver.osuosl.org (Postfix) with ESMTPS id 740A8203AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.goneo.de (Postfix) with ESMTP id 6FD2023FBB3;
 Thu, 27 Feb 2020 09:47:47 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
 by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGR4Fuwz1hdT; Thu, 27 Feb 2020 09:47:46 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-096-139-105.ewe-ip-backbone.de
 [91.96.139.105])
 by smtp2.goneo.de (Postfix) with ESMTPSA id 7B2D723F4C9;
 Thu, 27 Feb 2020 09:47:45 +0100 (CET)
To: Amol Grover <frextrite@gmail.com>,
 amanharitsh123 <amanharitsh123@gmail.com>
References: <20200225183916.4555-1-amanharitsh123@gmail.com>
 <20200227083010.GB5241@workstation-portable>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <c844ac77-4841-3454-dc92-5af0c9800a22@darmarit.de>
Date: Thu, 27 Feb 2020 09:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227083010.GB5241@workstation-portable>
Content-Language: de-DE
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: Convert to checklist.txt to
 checklist.rst
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

Am 27.02.20 um 09:30 schrieb Amol Grover:

>> diff --git a/Documentation/RCU/checklist.txt b/Documentation/RCU/checklist.rst
>> similarity index 99%
>> rename from Documentation/RCU/checklist.txt
>> rename to Documentation/RCU/checklist.rst
>> index e98ff261a438..49bf7862c950 100644
>> --- a/Documentation/RCU/checklist.txt
>> +++ b/Documentation/RCU/checklist.rst
>> @@ -1,5 +1,7 @@
>> -Review Checklist for RCU Patches
>> +.. checklist doc:
> 2. The document identifier must always start with an underscore and
> should not contain white spaces, something like:
> .. _checklist_doc:
> should work.
> 

Sphinx supports whitespaces in anchor names, see by example [1]

[1] https://asciimoo.github.io/searx/dev/reST.html#anchors-links

  -- Markus --
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
