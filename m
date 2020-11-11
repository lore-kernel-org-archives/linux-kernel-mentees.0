Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297FBC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 05:19:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1C120709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 05:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmomcJ3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1C120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC08127662;
	Wed, 11 Nov 2020 05:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q+83xaFcQv9H; Wed, 11 Nov 2020 05:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A40A273B5;
	Wed, 11 Nov 2020 05:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A845C088B;
	Wed, 11 Nov 2020 05:19:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 443F0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 05:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B4265808BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 05:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uU5AuzlLk-qv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 05:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6125C86744
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 05:19:00 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id w20so118032pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 21:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=byqajXR51Bxrm2nLNt/skWT4Wzt+z9y1BMUZtfwxw1M=;
 b=TmomcJ3VO/TDdcQd7AqeVYVGrS3mo7rk8oLienr/ePQg5etHVT11FwlvRQoFvdNXOr
 S9P6kq16Cou+eFFSG34H7D66aSKoUQ+cJ13H7bgzHoXPhZWI0933A3fnozo9nXJAuLJu
 sy+g/h8kz5e444vH54MIRt8pCfgaDASD9+15xea7qcCoOZkU2EUtrMqlCV7Ph2jJtpqk
 X1aMuZnZvsZ41CMIU0eaou3n3ytWHSx0bKhXqPPRDO1GXJioA/Zy5DkufFXYYe4iTl5X
 VaWq1WNTxH/S1aNHXvKKppJ+JQzmvWMb8ow6mhHqkvqpknNxKmiG7A6LPSG0AEnnyKuy
 nb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=byqajXR51Bxrm2nLNt/skWT4Wzt+z9y1BMUZtfwxw1M=;
 b=KIVwVqXDcn66qV09BwwIV7Uq5Ho1ReIB3P/Ny/q4n6LKZgQRaLNr0Q5Hv+B5DAMz+N
 1HxQG4dIzAHtHLZCGwukF5g0AxQvNjT2Qg3gljUOG66R13+zNyh2zQz4EahTxnUfclSd
 9agXhZodfukUmJtYbMzaYq7DR5WTDxWFi82aYram28w4Q3ZU43ySyg4DKoMkG79o/vfg
 Dsq93Od3vNvcPuqZDi2uKE6ceE/ppjCUymelEJbQxI9zDLEIEdGw/ubaplkjxl8rc3PM
 Q58Rsj0VPMu3X5Kd6cPly5PuYkAyJHnTFruHNmZALh83rMpZy8G/Aq6JoCebYdK18ddK
 uUuw==
X-Gm-Message-State: AOAM532RzQFq8JuaLVSO9tyneFRC83/1f7WQqrb7velUr/LFZs806DrE
 Talz/RTx59UAB+3jC+pvaw==
X-Google-Smtp-Source: ABdhPJwzGr917BcjGZvnhF8M3M9oj/mD9MB7UdcXUskYUWvjxFIwl/G5As2je433FOGzXbhd2T6VIA==
X-Received: by 2002:a17:902:6545:b029:d6:9a59:800d with SMTP id
 d5-20020a1709026545b02900d69a59800dmr19714495pln.31.1605071939945; 
 Tue, 10 Nov 2020 21:18:59 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id s17sm801768pjr.56.2020.11.10.21.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 21:18:59 -0800 (PST)
Date: Wed, 11 Nov 2020 00:18:52 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>
Message-ID: <20201111051852.GA2491141@PWN>
References: <20200805180902.684024-1-yepeilin.cs@gmail.com>
 <20200909071700.1100748-1-yepeilin.cs@gmail.com>
 <AF20F58E-C800-45A8-A5B8-296DE4C0D906@holtmann.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AF20F58E-C800-45A8-A5B8-296DE4C0D906@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net v2] Bluetooth: Fix
 slab-out-of-bounds read in hci_le_direct_adv_report_evt()
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

On Mon, Nov 09, 2020 at 01:16:53PM +0100, Marcel Holtmann wrote:
> Hi Peilin,
> 
> > `num_reports` is not being properly checked. A malformed event packet with
> > a large `num_reports` number makes hci_le_direct_adv_report_evt() read out
> > of bounds. Fix it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 2f010b55884e ("Bluetooth: Add support for handling LE Direct Advertising Report events")
> > Reported-and-tested-by: syzbot+24ebd650e20bd263ca01@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=24ebd650e20bd263ca01
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >    - add "Cc: stable@" tag.
> > 
> > net/bluetooth/hci_event.c | 12 +++++-------
> > 1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > index 4b7fc430793c..aec43ae488d1 100644
> > --- a/net/bluetooth/hci_event.c
> > +++ b/net/bluetooth/hci_event.c
> > @@ -5863,21 +5863,19 @@ static void hci_le_direct_adv_report_evt(struct hci_dev *hdev,
> > 					 struct sk_buff *skb)
> > {
> > 	u8 num_reports = skb->data[0];
> > -	void *ptr = &skb->data[1];
> > +	struct hci_ev_le_direct_adv_info *ev = (void *)&skb->data[1];
> > 
> > -	hci_dev_lock(hdev);
> > +	if (!num_reports || skb->len < num_reports * sizeof(*ev) + 1)
> > +		return;
> > 
> > -	while (num_reports--) {
> > -		struct hci_ev_le_direct_adv_info *ev = ptr;
> > +	hci_dev_lock(hdev);
> > 
> > +	for (; num_reports; num_reports--, ev++)
> > 		process_adv_report(hdev, ev->evt_type, &ev->bdaddr,
> > 				   ev->bdaddr_type, &ev->direct_addr,
> > 				   ev->direct_addr_type, ev->rssi, NULL, 0,
> > 				   false);
> > 
> > -		ptr += sizeof(*ev);
> > -	}
> > -
> > 	hci_dev_unlock(hdev);
> > }
> 
> patch has been applied to bluetooth-next tree.

Thank you for reviewing it,

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
