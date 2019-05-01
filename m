From: khalid.aziz@oracle.com (Khalid Aziz)
Date: Wed, 1 May 2019 08:16:30 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] Staging: rtl8192e: rtl8192e:
 Removed extra space before break statement
In-Reply-To: <CABhMZUVycH6MyjS=EtEekg1dDV+piv+dw4s3bSXiGkte=rimUA@mail.gmail.com>
References: <20190430195903.GA30960@arch>
	<633a89cb-4cf9-6885-c53c-94c8f1c0e924@linuxfoundation.org>
	<CABhMZUVycH6MyjS=EtEekg1dDV+piv+dw4s3bSXiGkte=rimUA@mail.gmail.com>
Message-ID: <913af98f-525a-663a-1db4-966db6fdb163@oracle.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501141630.jWGQpOiJgm1-1YYvdtJKW_0mXiupzJqpomzVTbGhLGc@z>

On 4/30/19 5:50 PM, Bjorn Helgaas wrote:
> On Tue, Apr 30, 2019 at 5:19 PM Shuah Khan <skhan at linuxfoundation.org> wrote:
>>
>> On 4/30/19 1:59 PM, Puranjay Mohan wrote:
>>> Fixed a style issues reported by checkpatch.pl
>>> break statements had extra spaces before them, so they didn't end at
>>> tabstop. Removed the extra space before them to correct the issue.
>>
>> You could rephrase the above to say
>>
>> "Removed extra spaces before "break" statements to fix the following
>> warnings from checkpatch.pl"
> 
> Here's a great post about commit logs: https://chris.beams.io/posts/git-commit/
> 
> One hint is to use the imperative mood, as though you're giving a
> command, e.g., "Remove extra spaces ..."  That matches the messages
> git generates for merges and reverts.  Chris says this is only
> important in the subject line, not in the body, but I enforce it
> everywhere.  I might be OCD.
> 

I agree with Bjorn. Another way to think of it is to describe what your
patch does when one applies it to their tree, as opposed to describing
what you have done in the patch.

--
Khalid
