Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F21C33CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 22:04:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9BE21569
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 22:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9BE21569
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 264B48851F;
	Thu, 23 Jan 2020 22:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-DbhloBFDqh; Thu, 23 Jan 2020 22:04:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E8A4884ED;
	Thu, 23 Jan 2020 22:04:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 345F2C18DD;
	Thu, 23 Jan 2020 22:04:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0B00C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 22:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A9DB722274
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 22:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGINjPZOH8nL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 22:04:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F71C20377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 22:04:45 +0000 (UTC)
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1iukaX-0004Li-4E; Thu, 23 Jan 2020 23:04:33 +0100
Received: from [178.197.248.20] (helo=pc-9.home)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1iukaW-000K4o-HK; Thu, 23 Jan 2020 23:04:32 +0100
To: Amol Grover <frextrite@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, brouer@redhat.com, toke@redhat.com
References: <20200123120437.26506-1-frextrite@gmail.com>
 <20200123171800.GC4484@workstation-portable>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <991cab17-3616-4cb4-60f5-5fe235e5bec8@iogearbox.net>
Date: Thu, 23 Jan 2020 23:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200123171800.GC4484@workstation-portable>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25704/Thu Jan 23 12:37:43 2020)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep
	expression to RCU lists
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

On 1/23/20 6:18 PM, Amol Grover wrote:
> On Thu, Jan 23, 2020 at 05:34:38PM +0530, Amol Grover wrote:
>> head is traversed using hlist_for_each_entry_rcu outside an
>> RCU read-side critical section but under the protection
>> of dtab->index_lock.
>>
>> Hence, add corresponding lockdep expression to silence false-positive
>> lockdep warnings, and harden RCU lists.
>>
> Fixes: 6f9d451ab1a3 ("xdp: Add devmap_hash map type for looking up devices by hashed index")
>> Signed-off-by: Amol Grover <frextrite@gmail.com>

Applied, thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
