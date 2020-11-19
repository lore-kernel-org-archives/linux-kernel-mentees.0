Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242DAC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:10:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620BE246BB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620BE246BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C84DE86D0F;
	Thu, 19 Nov 2020 08:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T65bZvHyHb63; Thu, 19 Nov 2020 08:10:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCBC286D03;
	Thu, 19 Nov 2020 08:10:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B97C4C1825;
	Thu, 19 Nov 2020 08:10:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21B8EC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0B97087227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcAO0bmfAkhy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:10:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com
 [216.40.44.232])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0298871C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:10:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id A6670181D3026;
 Thu, 19 Nov 2020 08:10:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: stage20_160f08027341
X-Filterd-Recvd-Size: 7740
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Thu, 19 Nov 2020 08:10:45 +0000 (UTC)
Message-ID: <cf279eb568e02c0d56feddeab535e731f48c4691.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Aditya Srivastava
 <yashsri421@gmail.com>, linux-kernel-mentees@lists.linuxfoundation.org, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 19 Nov 2020 00:10:44 -0800
In-Reply-To: <CAKXUXMxNZ+PzdXHxYcYa4Yv2PO9oEx6Ob8LECc+hFzN5H_-HJQ@mail.gmail.com>
References: <CAKXUXMxNZ+PzdXHxYcYa4Yv2PO9oEx6Ob8LECc+hFzN5H_-HJQ@mail.gmail.com>
Content-Type: multipart/mixed; boundary="=-SiR3+Ool4WxLvkjXk23x"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Subject: Re: [Linux-kernel-mentees] Potential new task: a new self-test in
	get-maintainers.pl
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--=-SiR3+Ool4WxLvkjXk23x
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-19 at 08:38 +0100, Lukas Bulwahn wrote:
> Hi Aditya, Hi Dwaipayan,
> 
> here another potential task for some perl work:
> 
> Implement a new self-test in get-maintainers.pl that checks if a file
> entry line is already covered by the others provided, i.e., all files
> matching to one file entry line is already matched by all the other
> file entry lines of the same section.
> 
> Here is a quick example where I did something wrong of that kind:
> https://lore.kernel.org/netfilter-devel/20201109091942.32280-1-lukas.bulwahn@gmail.com/
> 
> This needs a bit of reading and understanding the MAINTAINERS file and
> what get_maintainers.pl does with those entries. get-maintainers.pl
> already implements some self-test checks and you can add this check
> above to the existing ones.

I think that's a pretty trivial defect.  Overlaps aren't fatal.

Renames and moves are pretty common though and the maintainers
F: and X: patterns aren't always correct/current.

Perhaps more useful would be a new script that tracks all the various
commit file moves/renames and maps those to the MAINTAINERS sections
so that the moved/renamed file patterns in MAINTAINERS are updated.

That's rather out-of-scope for both get_maintainer.pl and checkpatch.pl

A trivial script I wrote and used a couple years ago is attached.

https://lore.kernel.org/lkml/da894e81adc28ac98d9c399d24d8eb075b30fd1a.camel@perches.com/

Done using -next with an empty patterns directory

$ perl ./scripts/get_maintainer.pl --self-test=patterns | \
  cut -f2 -d: | \
  while read line ; do \
    perl ./dump_section.perl $line \
  done



--=-SiR3+Ool4WxLvkjXk23x
Content-Type: application/x-perl; name="dump_section.pl"
Content-Disposition: attachment; filename="dump_section.pl"
Content-Transfer-Encoding: base64

bXkgJGkgPSAkQVJHVlswXTsKCm15IEBvdXRwdXQgPSAoKTsKbXkgQGxpbmVzID0gKCk7Cm9wZW4g
KG15ICRtYWludCwgJzwnLCAiTUFJTlRBSU5FUlMiKQogICAgb3IgZGllICIkUDogQ2FuJ3Qgb3Bl
biBNQUlOVEFJTkVSUyBmaWxlICdNQUlOVEFJTkVSUyc6ICQhXG4iOwp3aGlsZSAoPCRtYWludD4p
IHsKICAgIG15ICRsaW5lID0gJF87CiAgICBwdXNoKEBsaW5lcywgJGxpbmUpOwp9CmNsb3NlKCRt
YWludCk7CgpteSAkbG93X2luZGV4ID0gJGkgLSAxOwoKd2hpbGUgKCRsaW5lc1skbG93X2luZGV4
XSA9fiAvXi46LyAmJiAkbG93X2luZGV4ID4gMCkgewogICAgJGxvd19pbmRleC0tOwp9CgpteSAk
aGlnaF9pbmRleCA9ICRpIC0gMTsKd2hpbGUgKCRsaW5lc1skaGlnaF9pbmRleF0gPX4gL14uOi8g
JiYgJGhpZ2hfaW5kZXggPCAkI2xpbmVzKSB7CiAgICAkaGlnaF9pbmRleCsrOwp9CgpwdXNoKEBv
dXRwdXQsICJBIGZpbGUgcGF0dGVybiBsaW5lIGluIHRoaXMgc2VjdGlvbiBvZiB0aGUgTUFJTlRB
SU5FUlMgZmlsZSBpbiBsaW51eC1uZXh0XG4iKTsKcHVzaChAb3V0cHV0LCAiZG9lcyBub3QgaGF2
ZSBhIG1hdGNoIGluIHRoZSBsaW51eCBzb3VyY2UgZmlsZXMuXG4iKTsKcHVzaChAb3V0cHV0LCAi
XG4iKTsKcHVzaChAb3V0cHV0LCAiVGhpcyBjb3VsZCBvY2N1ciBiZWNhdXNlIGEgbWF0Y2hpbmcg
ZmlsZW5hbWUgd2FzIG5ldmVyIGFkZGVkLCB3YXMgZGVsZXRlZFxuIik7CnB1c2goQG91dHB1dCwg
Im9yIHJlbmFtZWQgaW4gc29tZSBvdGhlciBjb21taXQuXG4iKTsKcHVzaChAb3V0cHV0LCAiXG4i
KTsKcHVzaChAb3V0cHV0LCAiVGhlIGNvbW1pdHMgdGhhdCBhZGRlZCBhbmQgaWYgZm91bmQgcmVu
YW1lZCBvciByZW1vdmVkIHRoZSBmaWxlIHBhdHRlcm5cbiIpOwpwdXNoKEBvdXRwdXQsICJhcmUg
c2hvd24gYmVsb3cuXG4iKTsKcHVzaChAb3V0cHV0LCAiXG4iKTsKcHVzaChAb3V0cHV0LCAiUGxl
YXNlIGZpeCB0aGlzIGRlZmVjdCBhcHByb3ByaWF0ZWx5LlxuIik7CnB1c2goQG91dHB1dCwgIlxu
Iik7CgpwdXNoKEBvdXRwdXQsICIxOiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1cbiIpOwpwdXNoKEBvdXRw
dXQsICJcbiIpOwpwdXNoKEBvdXRwdXQsICJsaW51eC1uZXh0IE1BSU5UQUlORVJTIHNlY3Rpb246
XG4iKTsKcHVzaChAb3V0cHV0LCAiXG4iKTsKCm15ICRmaWxlID0gJGxpbmVzWyRpLTFdOwokZmls
ZSA9fiBzL15bQS1aXTpccysvLzsKY2hvbXAgJGZpbGU7CgpteSAkc2VjdGlvbiA9ICRsaW5lc1sk
bG93X2luZGV4XTsKCndoaWxlICgkbG93X2luZGV4IDwgJGhpZ2hfaW5kZXgpIHsKICAgIHB1c2go
QG91dHB1dCwgIi0tPiIpIGlmICgkbG93X2luZGV4ID09ICRpLTEpOwogICAgcHVzaChAb3V0cHV0
LCAiXHQiIC4gKCRsb3dfaW5kZXgrMSkgLiAiXHQiIC4gJGxpbmVzWyRsb3dfaW5kZXhdKTsKICAg
ICRsb3dfaW5kZXgrKzsKfQoKcHVzaChAb3V0cHV0LCAiXG4iKTsKcHVzaChAb3V0cHV0LCAiMjog
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXG4iKTsKcHVzaChAb3V0cHV0LCAiXG4iKTsKCm15IEBibGFtZSA9
IGBnaXQgYmxhbWUgLUwkaSwrMSBNQUlOVEFJTkVSU2A7Cm15IEBjb21taXRzID0gc3BsaXQoJyAn
LCAkYmxhbWVbMF0pOwpteSAkY29tbWl0ID0gJGNvbW1pdHNbMF07Cm15IEBjb21taXRfbGluZXMg
PSBgZ2l0IGxvZyAtMSAtLXN0YXQgJGNvbW1pdGA7CgpwdXNoKEBvdXRwdXQsICJUaGUgbW9zdCBy
ZWNlbnQgY29tbWl0IHRoYXQgYWRkZWQgb3IgbW9kaWZpZWQgZmlsZSBwYXR0ZXJuICckZmlsZSc6
XG4iKTsKcHVzaChAb3V0cHV0LCAiXG4iKTsKcHVzaChAb3V0cHV0LCBAY29tbWl0X2xpbmVzKTsK
CnB1c2goQG91dHB1dCwgIlxuIik7CnB1c2goQG91dHB1dCwgIjM6IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LVxuIik7CnB1c2goQG91dHB1dCwgIlxuIik7CgpteSBAZm9sbG93ID0gYGdpdCBsb2cgLS1mb2xs
b3cgLTEgLS1zdGF0IC1NIC0tICckZmlsZSdgOwppZiAoIUBmb2xsb3cpIHsKICAgIHB1c2goQG91
dHB1dCwgIk5vIGNvbW1pdCB3aXRoIGZpbGUgcGF0dGVybiAnJGZpbGUnIHdhcyBmb3VuZFxuIik7
Cn0gZWxzZSB7CiAgICBteSAkY29tbWl0ID0gJGZvbGxvd1swXTsKICAgICRjb21taXQgPX4gcy9e
Y29tbWl0IC8vOwogICAgQGZvbGxvdyA9IGBnaXQgbG9nIC0tc3RhdCAtMSAtTSAkY29tbWl0YDsK
ICAgIHB1c2goQG91dHB1dCwgIlRoZSBsYXN0IGNvbW1pdCB3aXRoIGEgcmVhbCBwcmVzZW5jZSBv
ZiBmaWxlIHBhdHRlcm4gJyRmaWxlJzpcbiIpOwogICAgcHVzaChAb3V0cHV0LCAiXG4iKTsKICAg
IHB1c2goQG91dHB1dCwgQGZvbGxvdyk7Cn0KCm15IEBtYWludGFpbmVycyA9IGdyZXAoL15ccytc
ZCtccytbTFJNXTouKiQvLCBAb3V0cHV0KTsKbXkgQHNpZ25lcnMgPSBncmVwKC9eXHMrLiotYnk6
LiokLywgQG91dHB1dCk7CgpvcGVuIChteSAkZmlsZWgsICc+JywgInBhdHRlcm5zLyRpLnR4dCIp
OwoKJHNlY3Rpb24gPX4gcy9eXHMrXGQrXHMrLy87CiRzZWN0aW9uID1+IHMvXG4kLy87Cgpwcmlu
dCAkZmlsZWggIlN1YmplY3Q6IEJhZCBmaWxlIHBhdHRlcm4gaW4gTUFJTlRBSU5FUlMgc2VjdGlv
biAnJHNlY3Rpb24nXG4iOwpwcmludCAkZmlsZWggIlxuIjsKcHJpbnQgJGZpbGVoIChAb3V0cHV0
KTsKCmZvcmVhY2ggbXkgJG0gKEBtYWludGFpbmVycykgewogICAgJG0gPX4gcy9eXHMrXGQrXHMr
LjpccysvLzsKICAgICRtID1+IHMvXHMqXCguKlwpLiokLy87Cn0KCmZvcmVhY2ggbXkgJHMgKEBz
aWduZXJzKSB7CiAgICAkcyA9fiBzL15ccypbXHdcLV0rLWJ5OlxzKi8vOwp9CgojcHJpbnQgJGZp
bGVoICgiXG5tYWludGFpbmVyczpcblxuIik7CiNwcmludCAkZmlsZWggKEBtYWludGFpbmVycyk7
CiNwcmludCAkZmlsZWggKCJcbnNpZ25lcnM6XG5cbiIpOwojcHJpbnQgJGZpbGVoIChAc2lnbmVy
cyk7CgpteSBAZW1haWxzID0gKCk7CmZvcmVhY2ggbXkgJGVtYWlsIChAbWFpbnRhaW5lcnMsQHNp
Z25lcnMpIHsKICAgIHB1c2goQGVtYWlscywgJGVtYWlsKSB1bmxlc3MgJGF7JGVtYWlsfSsrOwp9
CgojcHJpbnQgJGZpbGVoICgiXG5lbWFpbHM6XG5cbiIpOwojcHJpbnQgJGZpbGVoIChAZW1haWxz
KTsKCm15ICRjYyA9ICIiOwpmb3JlYWNoIG15ICRlbWFpbCAoQGVtYWlscykgewogICAgbXkgJHQg
PSAkZW1haWw7CiAgICAkdCA9fiBzL1xuJC8vOwogICAgJHQgPX4gcy8iLy9nOwogICAgJGNjIC49
ICIgLS1jYyBcIiR0XCIiOwp9CgpjbG9zZSAkZmlsZWg7CgpteSAkZ3NtID0gImdpdCBzZW5kLWVt
YWlsIC0tdG8gXCJsaW51eC1rZXJuZWxcQHZnZXIua2VybmVsLm9yZ1wiIiAuICRjYyAuICIgcGF0
dGVybnMvJGkudHh0IjsKcHJpbnQoIiRnc21cbiIpOwoKI215IEBnc21fb3V0cHV0ID0gYCRnc21g
OwoKI3ByaW50KEBnc21fb3V0cHV0KTsK


--=-SiR3+Ool4WxLvkjXk23x
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--=-SiR3+Ool4WxLvkjXk23x--

