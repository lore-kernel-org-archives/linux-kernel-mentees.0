Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFBCC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 01:13:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE3C2177B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 01:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE3C2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3343A86B02;
	Fri, 23 Oct 2020 01:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRPRMUdARr1d; Fri, 23 Oct 2020 01:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5AD8886AFD;
	Fri, 23 Oct 2020 01:13:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43D4EC0052;
	Fri, 23 Oct 2020 01:13:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A03D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 01:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 948FC8716B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 01:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dATLHHm0kdG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 01:13:20 +0000 (UTC)
X-Greylist: delayed 05:40:10 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0228.hostedemail.com
 [216.40.44.228])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1B8587145
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 01:13:20 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 3882918023435
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 22:46:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id D11DF18029120;
 Thu, 22 Oct 2020 22:46:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: kiss89_0b08c1a27254
X-Filterd-Recvd-Size: 3400
Received: from XPS-9350 (cpe-72-134-80-165.natsow.res.rr.com [72.134.80.165])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Thu, 22 Oct 2020 22:46:53 +0000 (UTC)
Message-ID: <b853a8ab4daface74075e93d83f94655f13a2979.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>
Date: Thu, 22 Oct 2020 15:46:50 -0700
In-Reply-To: <edaa9012-d512-26fc-0aca-f0eaf889a050@gmail.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
 <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
 <5121bf7c-a126-6178-62ff-e54f0bb4cb6e@gmail.com>
 <67247b2d51aa8b2da7377e400e9191733144ed0f.camel@perches.com>
 <edaa9012-d512-26fc-0aca-f0eaf889a050@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On Fri, 2020-10-23 at 02:35 +0530, Aditya wrote:
> On 23/10/20 1:03 am, Joe Perches wrote:
> > On Fri, 2020-10-23 at 00:44 +0530, Aditya wrote:
> > > On 22/10/20 9:40 pm, Joe Perches wrote:
> > > > On Thu, 2020-10-22 at 20:20 +0530, Aditya Srivastava wrote:
> > > > > Presence of hexadecimal address or symbol results in false warning
> > > > > message by checkpatch.pl.
> > > > []
> > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > []
> > > > > @@ -3051,7 +3051,10 @@ sub process {
> > > > >  		}
> > > > >  
> > > > >  # check for repeated words separated by a single space
> > > > > -		if ($rawline =~ /^\+/ || $in_commit_log) {
> > > > > +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> > > > > +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> > > > > +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
> > > > 
> > > > Alignment and use \b before and after the regex please.
> > > 
> > > If we use \b either before or after or both it does not match patterns
> > > such as:
> > > +   -rw-r--r--. 1 root root 112K Mar 20 12:16'
> > selinux-policy-3.14.4-48.fc31.noarch.rpm
> > 
> > OK, thanks, it's good you checked.
> > 
> > > > []
> > > > What does all this code actually avoid?
> > > 
> > > Sir, there are multiple variations of hex for which this warning is
> > > occurring, for eg:
> > > 1) 00 c0 06 16 00 00 ff ff 00 93 1c 18 00 00 ff ff  ................
> > > 2) ffffffff ffffffff 00000000 c070058c
> > > 3)     f5a:       48 c7 44 24 78 ff ff    movq
> > > $0xffffffffffffffff,0x78(%rsp)
> > > 4) +    fe fe
> > > 5) +    fe fe   - ? end marker ?
> > > 6) Code: ff ff 48 (...)
> > 
> > So why not just match first with /^[0-9a-f]+$/i ?
> > 
> > Doesn't that match all the cases listed above?
> > 
> > 
> 
> Then, we'll not be able to account for cases such as:
> 
> 1) +     * sets this to -1, the slack value will be calculated to be be
> halfway [For 'be' 'be']
> 2) + * @seg: index of packet segment whose raw fields are to be be
> extracted [For 'be' 'be']
> 3) Let's also add add a note about using only the l3 access without l4
> [For 'add' 'add']

Like the use of long, I think you're better off with
either a list or hash of specific words to ignore.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
