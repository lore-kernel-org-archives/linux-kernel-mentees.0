Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56CBC433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 21:56:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C27206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 21:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C27206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exemail.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6AE07860BE;
	Thu, 23 Jul 2020 21:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DseFkhLQPD8l; Thu, 23 Jul 2020 21:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AC72860AE;
	Thu, 23 Jul 2020 21:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E9A0C004E;
	Thu, 23 Jul 2020 21:56:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AEE3C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 21:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4677E882D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 21:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aE8xw7mQYRTX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 21:56:46 +0000 (UTC)
X-Greylist: delayed 00:15:13 by SQLgrey-1.7.6
Received: from pecan.exetel.com.au (pecan-mail.exetel.com.au [220.233.0.8])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDB0E882C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 21:56:45 +0000 (UTC)
Received: from 221.167.233.220.static.exetel.com.au ([220.233.167.221]
 helo=[192.168.1.125]) by pecan.exetel.com.au with esmtp (Exim 4.91)
 (envelope-from <vk2tv@exemail.com.au>)
 id 1jyixu-0006Af-0h; Fri, 24 Jul 2020 07:41:22 +1000
To: Dan Carpenter <dan.carpenter@oracle.com>, Peilin Ye <yepeilin.cs@gmail.com>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200723142814.GQ2549@kadam> <20200723151355.GA412829@PWN>
 <20200723155057.GS2549@kadam>
From: vk2tv <vk2tv@exemail.com.au>
Message-ID: <88638b87-0021-71af-cda8-5a58c81a6e8a@exemail.com.au>
Date: Fri, 24 Jul 2020 07:41:20 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200723155057.GS2549@kadam>
Content-Language: en-US
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>, Joerg Reuter <jreuter@yaina.de>
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds
 read in ax25_connect()
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



On 24/7/20 1:50 am, Dan Carpenter wrote:
> On Thu, Jul 23, 2020 at 11:13:55AM -0400, Peilin Ye wrote:
>> On Thu, Jul 23, 2020 at 05:28:15PM +0300, Dan Carpenter wrote:
>>> On Wed, Jul 22, 2020 at 11:19:01AM -0400, Peilin Ye wrote:
>>>> Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
>>>> ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
>>>> equals to 7 or 8. Fix it.
>>>>
>>>> This issue has been reported as a KMSAN uninit-value bug, because in such
>>>> a case, ax25_connect() reaches into the uninitialized portion of the
>>>> `struct sockaddr_storage` statically allocated in __sys_connect().
>>>>
>>>> It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
>>>> `addr_len` is guaranteed to be less than or equal to
>>>> `sizeof(struct full_sockaddr_ax25)`.
>>>>
>>>> Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
>>>> Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
>>>> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
>>>> ---
>>>>   net/ax25/af_ax25.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>>>> index fd91cd34f25e..ef5bf116157a 100644
>>>> --- a/net/ax25/af_ax25.c
>>>> +++ b/net/ax25/af_ax25.c
>>>> @@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
>>>>   	if (addr_len > sizeof(struct sockaddr_ax25) &&
>>>>   	    fsa->fsa_ax25.sax25_ndigis != 0) {
>>>>   		/* Valid number of digipeaters ? */
>>>> -		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
>>>> +		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
>>>> +		    addr_len < sizeof(struct sockaddr_ax25) +
>>>> +		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
>>> The "sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis" can have an
>>> integer overflow so you still need the
>>> "fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS" check.
>> Thank you for fixing this up! I did some math but I didn't think of
>> that. Will be more careful when removing things.
> No problem.  You had the right approach to look for ways to clean things
> up.
>
> Your patches make me happy because you're trying to fix important bugs.
>
> regards,
> dan carpenter
As a long-term user (25 years) of kernel ax25 I appreciate any and all 
efforts to improve the code (which I mostly don't understand), and I 
applaud those individuals rising to the task.

Thanks guys (and gals).

Ray vk2tv
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
